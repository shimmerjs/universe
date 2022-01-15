#!/usr/bin/env bash

journalctl -u k3s.service -n 10 --follow