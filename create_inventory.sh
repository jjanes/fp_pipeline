#!/bin/bash
cd ./terraform/
echo "[prod]" >  ../ansible/.inventory
terraform output prod-web >> ../ansible/.inventory
terraform output prod-db >> ../ansible/.inventory
terraform output prod-kibana >> ../ansible/.inventory
terraform output prod-log >> ../ansible/.inventory
echo "[web]" >> ../ansible/.inventory
terraform output prod-web >> ../ansible/.inventory
echo "[db]" >> ../ansible/.inventory
terraform output prod-db >> ../ansible/.inventory
echo "[log]" >> ../ansible/.inventory
terraform output prod-log >> ../ansible/.inventory
echo "[kibana]" >>  ../ansible/.inventory
terraform output prod-kibana >> ../ansible/.inventory
