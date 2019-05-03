#! /usr/bin/env python
# -*- coding: utf-8 -*-

import re
import sys
from discriminator_registration_pattern import pattern


def main():

    assert len(sys.argv) == 3, "Required 2 arguments: <json_java_path> <discriminator_replacement_path>"

    json_java_path = sys.argv[1]
    replacement_path = sys.argv[2]

    json_file_content = open(json_java_path).read()
    replacement = open(replacement_path).read()

    new_json_content = re.sub(pattern, replacement, json_file_content)

    with open(json_java_path, "w") as fout:
        fout.write(new_json_content)


# -------------------

main()
