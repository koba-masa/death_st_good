#!/bin/bash

sudo systemctl stop nginx
sudo systemctl stop death_st_good_puma.service

sudo systemctl start death_st_good_puma.service
sudo systemctl start nginx
