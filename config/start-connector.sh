#!/bin/bash                                                                                                                                                                                                                    
mkdir /mnt-connector/                                                                                                                                                                                                          
sudo mount /dev/vdb /mnt-connector                                                                                                                                                                                             
pm2 start /mnt-connector/hello-server.js
