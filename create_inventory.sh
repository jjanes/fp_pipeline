#!/bin/bash
cd ./terraform/
echo "[prod]" >  ../ansible/.inventory
terraform output prod-web01 >> ../ansible/.inventory
terraform output prod-db01 >> ../ansible/.inventory
echo "[web]" >> .inventory
terraform output prod-web01 >> ../ansible/.inventory
echo "[db]" >> .inventory
terraform output prod-db01 >> ../ansible/.inventory
