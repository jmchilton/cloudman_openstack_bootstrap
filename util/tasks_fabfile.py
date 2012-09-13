
from fabric.api import sudo, env, cd

def update_galaxy():
    with cd(env.get("galaxy_home")):
        sudo("hg pull; hg update", user="galaxy")
