#! /usr/bin/env python
# -*- coding: utf-8 -*-

import re
import sys


def main():

    assert len(sys.argv) == 3, "Required 2 arguments: <json_java_path> <imports_replacement_path>"

    json_java_path = sys.argv[1]
    replacement_path = sys.argv[2]

    json_file_content = open(json_java_path).read()
    imports = set(open(replacement_path).readlines())

    import_pattern = re.compile(r"import com\.isagog\.api\..*")
    package_pattern = re.compile(r"(package .*)")

    new_json_content = re.sub(import_pattern, "", json_file_content)
    new_json_content = re.sub(package_pattern, r"\1\n\n" + "".join(imports), new_json_content)

    with open(json_java_path, "w") as fout:
        fout.write(new_json_content)


# -------------------

main()
