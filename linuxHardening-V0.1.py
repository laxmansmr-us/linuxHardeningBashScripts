import subprocess

def check_module_loaded(module_name):
    """Check if a kernel module is loaded."""
    try:
        result = subprocess.run(['lsmod'], capture_output=True, text=True)
        return module_name in result.stdout
    except subprocess.SubprocessError as e:
        print(f"Error checking module: {e}")
        return False

def unload_module(module_name):
    """Unload a kernel module."""
    try:
        result = subprocess.run(['rmmod', module_name], capture_output=True, text=True)
        if result.returncode == 0:
            print(f"{module_name} module successfully unloaded")
        else:
            print(f"Failed to unload {module_name} module")
    except subprocess.SubprocessError as e:
        print(f"Error unloading module: {e}")

def blacklist_module(module_name):
    """Check if a module is blacklisted and blacklist it if not."""
    try:
        with open("/etc/modprobe.d/cramfs.conf", "a+") as file:
            file.seek(0)
            if any("blacklist " + module_name in line for line in file):
                print(f"{module_name} is blacklisted.")
            else:
                file.write(f"install {module_name} /bin/false\nblacklist {module_name}\n")
                print(f"Appended to {module_name}.conf")
    except IOError as e:
        print(f"Error accessing cramfs.conf: {e}")

module = "cramfs"

# Check if the module is loaded
if check_module_loaded(module):
    print(f"{module} module is loaded, Unloading it now")
    unload_module(module)
else:
    print(f"{module} module is not loaded")

# Check and update blacklist
blacklist_module(module)
