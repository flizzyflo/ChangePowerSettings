
import os
import subprocess


def getActiveEnergyScheme() -> str:
    
    return subprocess.call(os.path.join(os.getcwd(), 'executable.ps1'))

