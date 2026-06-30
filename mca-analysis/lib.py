#!/usr/bin/env python3
import subprocess
import os
import logging
import pathlib

def root_dir() -> pathlib.Path:
    return  pathlib.Path(subprocess.check_output(['git', 'rev-parse', '--show-toplevel']).decode('utf-8').strip())

def git_hash() -> str:
    return subprocess.check_output(['git', 'rev-parse', 'HEAD']).decode('utf-8').strip()

def machine_uname() -> str:
    return subprocess.check_output(['uname', '-a']).decode('utf-8').strip()

def machine_hostname() -> str:
    return subprocess.check_output(['hostname']).decode('utf-8').strip()

def machine_username() -> str:
    try:
        return subprocess.check_output(['logname'], stderr=subprocess.DEVNULL).decode('utf-8').strip()
    except subprocess.CalledProcessError:
        return os.environ.get('USER') or subprocess.check_output(['whoami']).decode('utf-8').strip()

STATUS_FAIL = "❌"
STATUS_GREEN_CHECK = "✅"
STATUS_SUCCESS = "🎉"
STATUS_PROCESSING = "⌛️"

def setup_logging(log_file_path : str):
    # Set up the logging configuration
    logging.basicConfig(level=logging.INFO,
        format='%(asctime)s - %(levelname)s - %(message)s',
        handlers=[logging.FileHandler(f'log_file_path', mode='a'), logging.StreamHandler()])
