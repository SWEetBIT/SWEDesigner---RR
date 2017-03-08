#!/bin/bash
git checkout trender
git pull
git add trender/*
git commit -m "Aggiunti file generati da trender"
git push origin trender
