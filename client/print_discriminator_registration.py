#! /usr/bin/env python
# -*- coding: utf-8 -*-

import re
import sys
from discriminator_registration_pattern import pattern


def main():

    assert len(sys.argv) == 2, "Required 1 argument: <json_java_path>"

    json_java_path = sys.argv[1]

    file_content = open(json_java_path).read()
    matches = re.findall(pattern, file_content)

    print(matches[0][0] + "\n")


# -------------------

main()
