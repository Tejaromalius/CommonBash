import os
import pytest
import subprocess


@pytest.fixture
def script_paths():
    scripts_dir = "recipes/"
    script_paths = {
        basename: os.path.join(scripts_dir, basename, f"{basename}.sh")
        for basename in os.listdir(scripts_dir)
    }
    return script_paths


def test_compilation(script_paths):
    for basename, script_path in script_paths.items():
        process = subprocess.run(["shellcheck", "-e", "SC2148,SC2162", script_path])
        assert process.returncode == 0, f"`{basename}` failed to compile!"


def test_execution(script_paths):
    for basename, script_path in script_paths.items():
        process = subprocess.run(
            ["bash", "-c", "-i",
                f"source {script_path}; {basename} > /dev/null"]
        )
        assert process.returncode == 0, f"`{basename}` failed to execute!"
