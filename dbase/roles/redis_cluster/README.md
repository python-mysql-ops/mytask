redis cluster 

redis-cli --cluster create 127.0.0.1:6001 127.0.0.1:6002 127.0.0.1:6003 127.0.0.1:6004 127.0.0.1:6005 127.0.0.1:6006 --cluster-replicas 1

Adding replica 127.0.0.1:6005 to 127.0.0.1:6001
Adding replica 127.0.0.1:6006 to 127.0.0.1:6002
Adding replica 127.0.0.1:6004 to 127.0.0.1:6003
