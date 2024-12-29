import os
import pytest
import subprocess


@pytest.fixture
def script_paths():
  scripts_dir = "src/recipes/"
  script_paths = {
    basename: os.path.join(scripts_dir, basename, f"{basename}.sh")
    for basename in os.listdir(scripts_dir)
  }
  return script_paths

@pytest.fixture
def scripts_to_skip():
  return ['snvim', 'venv', 'trash', 'lsps']

@pytest.fixture
def arguments():
  return {'tradency': 'bash'}

def test_compilation(script_paths, scripts_to_skip):
  for basename, script_path in script_paths.items():
    if basename in scripts_to_skip:
      print(f"Skipping `{basename}`...")
      continue

    print(f"Compiling `{basename}`...", end='\t')

    process = subprocess.run(["shellcheck", "-e", "SC2148,SC2162", script_path])
    assert process.returncode == 0, f"`{basename}` failed to compile!"
    print("OK")

def test_execution(script_paths, scripts_to_skip, arguments):
  for basename, script_path in script_paths.items():
    if basename in scripts_to_skip:
      print(f"Skipping `{basename}`...")
      continue
    print(f"Executing `{basename}`...", end='\t')

    process = subprocess.run(
      [
        "bash",
        "-c",
        "-i",
        f"source {script_path}; {basename} {arguments.get(basename, '')} 1> /dev/null"
      ]
    )
    assert process.returncode == 0, f"`{basename}` failed to execute!"
    print("OK")
