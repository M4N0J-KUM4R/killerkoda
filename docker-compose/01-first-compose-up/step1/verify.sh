#!/bin/bash
docker-compose ps | grep Up | grep web
docker-compose ps | grep Up | grep db
