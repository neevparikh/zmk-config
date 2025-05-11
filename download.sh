#!/usr/bin/env bash
rm -rf firmware
mkdir firmware
cd firmware
gh run download -n firmware
