#!/bin/bash
echo "[prod]" > .inventory
terraform output prod-web01 >> .inventory
terraform output prod-db01 >> .inventory
echo "[web]" >> .inventory
terraform output prod-web01 >> .inventory
echo "[db]" >> .inventory
terraform output prod-db01 >> .inventory
