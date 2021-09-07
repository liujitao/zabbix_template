#set -o xtrace

NUM_OF_RUNNING_NODES=$(sudo /usr/sbin/rabbitmqctl cluster_status|grep "running_nodes"|awk -F[ '{print $2}'|awk -F] '{print $1}'|awk -F, '{print NF}')
CONTROLLER_NODE_NUM=`expr $(sudo cat /etc/astute.yaml|grep "  role: controller"|wc -l) + $(sudo cat /etc/astute.yaml|grep "  role: primary-controller"|wc -l)`

if [[ ${NUM_OF_RUNNING_NODES} -ge $CONTROLLER_NODE_NUM  ]]
then
    echo 1
else 
    echo 0
fi
