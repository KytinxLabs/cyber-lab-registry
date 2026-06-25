import subprocess

subprocess.run([
    "docker", "exec", "victim1",
    "bash", "-c",
    "/morris.sh &"
])

