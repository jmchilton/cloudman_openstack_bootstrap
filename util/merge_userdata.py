#!/usr/bin/python
import sys
import os
import yaml

#http://stackoverflow.com/questions/823196/yaml-merge-in-python
def merge(specific, default):
    if isinstance(specific, dict) and isinstance(default, dict):
        for k, v in default.iteritems():
            if k not in specific:
                specific[k] = v
            else:
                specific[k] = merge(specific[k],v)
    return specific

def expand(yaml):
    if not type(yaml) in [list, dict]:
        return yaml
    if type(yaml) == list:
        iter = enumerate(yaml)
    else:
        iter = yaml.iteritems()
    for k, v in iter:
        if type(v) is str:
            value = os.path.expandvars(v)
            if value.startswith("PATH_BASE64|"):
                path = value[len("PATH_BASE64|"):]
                contents = open(path, "r").read()
                from base64 import b64encode
                base64_contents = b64encode(contents)
                value = base64_contents
            yaml[k] = value
        else:
            yaml[k] = expand(v)
    
    return yaml
            

name=sys.argv[1]
default="userdata-default.yaml"

default_yaml=expand(yaml.load(open(default, 'r').read()))
instance_yaml_path = "userdata-%s.yaml" % name
if os.path.exists(instance_yaml_path):
    instance_yaml = expand(yaml.load(open(instance_yaml_path, 'r').read()))
    default_yaml = merge(instance_yaml, default_yaml)


open("userdata-%s.merged.yaml" % name, "w").write(yaml.dump(default_yaml))
