#!/usr/bin/env bash

NAME=isagog-api-maven-jdk8
VERSION=2.0.0

sudo docker build --tag $NAME:$VERSION .
