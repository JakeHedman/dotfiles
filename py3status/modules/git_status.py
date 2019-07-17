import subprocess
import re
from os.path import expanduser

class Py3status:
  name = 'Git'
  path = '~/path_to_repo'
  def git_status(self):
    status_cmd = ['git', '-C', expanduser(self.path), 'status', '-b', '--porcelain=v2']
    status = subprocess.check_output(status_cmd).decode('utf-8')

    staged = 0
    unstaged = 0
    untracked = 0
    for line in status.splitlines()[4:]:
      if line[0] == '?': untracked += 1
      if len(line) < 4: continue
      if line[2] == 'M': staged += 1
      if line[3] == 'M': unstaged += 1

    pattern = r'#.branch.ab \+(\d+) -(\d+)'
    match = re.search(pattern, status)
    ahead = int(match.group(1))
    behind = int(match.group(2))

    texts = []
    if ahead:
      texts.append('{} ahead'.format(ahead))
    if behind:
      texts.append('{} behind'.format(behind))

    if staged or unstaged or untracked:
      texts.append('dirty')

    if len(texts):
      text = '{name}: {text}'.format(name=self.name, text=', '.join(texts))
    else:
      text = ''

    return {
      'full_text': text,
      'color': '#ffff00',
      'cached_until': self.py3.time_in(10)
    }
