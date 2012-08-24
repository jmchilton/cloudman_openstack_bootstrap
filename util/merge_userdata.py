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
    if not hasattr(yaml, 'iteritems'):
        return yaml
    for k, v in yaml.iteritems():
        if type(v) is str:
            yaml[k] = os.path.expandvars(v)
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
