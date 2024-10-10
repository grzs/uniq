import unittest
import subprocess

from uniq import main as uniq


class TestUniq(unittest.TestCase):

    def test_upper(self):
        self.assertEqual('foo'.upper(), 'FOO')
        subprocess.run("/usr/bin/uniq")

if __name__ == '__main__':
    unittest.main()
