#!/bin/bash

# Set Password
# Password: RootPasswordHadoop01
echo 'root:$6$8aNrWWCjJ.5i8QWm$INecL.i41koaCQmQBM8fFDvBFLnieO3LBMRdjCBMo58e7uWiDx4yful2C9hKZhyrBqHyHIw/YhBLI/Rkfx/bn1' | chpasswd -e;

# Set hosts
cat <<EOF >>/etc/hosts
# Hadoop
192.168.0.2 master
192.168.0.3 worker1
192.168.0.4 worker2
EOF

# Set SSH: use all same SSH keys
mkdir -p /root/.ssh
cat <<EOF >/root/.ssh/id_rsa
-----BEGIN OPENSSH PRIVATE KEY-----
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
-----END OPENSSH PRIVATE KEY-----
EOF
chmod 600 /root/.ssh/id_rsa

cat <<EOF >/root/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBF9bL8AEYpefnO+gjY8ezVoRby5mZfcxqX/hY+SQ1cgQ6mNIMIvencWkK+OETLhH1/XtX9MWdIvfo8BE++b/qlNZaKRT7AlshDJdaeoOqYOqz5Uhh+SVAkYNSGVbQ6dbEX/QyW5EOeXSzOWymI9EMZ4RbM+3Z+4Moq2r4wCRUps+1KfP50WOuQLt0M2iqV0sFkJoyE0YsL6na9BWyFlHhWkRP9TI/x1l427FDio0KPKSRvKP7wYL4KOfc2wtwxhieq8QdTMwZBSgKcU2/lmYIhPGmCBySC9OU2f+0LhM7I/2DgnUL6uAUlN0Rirz+7hSj/sG00dEAO6L5TYVrzL/cBz1ScNOYJGmnvIeSA0QPewRo8k341WXq6Gx/CR54tJR0LyWo6BGy1bL9LuItwRW4Ca9uMuzQmUypWFLGuKyeJewXh/F0rdETDltcSdy+M9I9BIqfxAbg14exVj5qNi6U2muam5/I55ms+NGpbbLwOmrDyGM/nTfmn+SDHsZ2p8E= Hadoop
EOF
chmod 600 /root/.ssh/id_rsa.pub

cat <<EOF >/root/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBF9bL8AEYpefnO+gjY8ezVoRby5mZfcxqX/hY+SQ1cgQ6mNIMIvencWkK+OETLhH1/XtX9MWdIvfo8BE++b/qlNZaKRT7AlshDJdaeoOqYOqz5Uhh+SVAkYNSGVbQ6dbEX/QyW5EOeXSzOWymI9EMZ4RbM+3Z+4Moq2r4wCRUps+1KfP50WOuQLt0M2iqV0sFkJoyE0YsL6na9BWyFlHhWkRP9TI/x1l427FDio0KPKSRvKP7wYL4KOfc2wtwxhieq8QdTMwZBSgKcU2/lmYIhPGmCBySC9OU2f+0LhM7I/2DgnUL6uAUlN0Rirz+7hSj/sG00dEAO6L5TYVrzL/cBz1ScNOYJGmnvIeSA0QPewRo8k341WXq6Gx/CR54tJR0LyWo6BGy1bL9LuItwRW4Ca9uMuzQmUypWFLGuKyeJewXh/F0rdETDltcSdy+M9I9BIqfxAbg14exVj5qNi6U2muam5/I55ms+NGpbbLwOmrDyGM/nTfmn+SDHsZ2p8E= Hadoop
EOF
chmod 600 /root/.ssh/authorized_keys

cat <<EOF >> /etc/ssh/sshd_config
PermitRootLogin yes
HostkeyAlgorithms +ssh-rsa
PubkeyAcceptedAlgorithms +ssh-rsa
EOF

cat <<EOF >/etc/hadoop/core-site.xml
<configuration>
    <property>
        <name>hadoop.tmp.dir</name>
        <value>/usr/local/hadoop/tmp</value>
        <description>Abase for other temporary directories.</description>
    </property>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://master:9000</value>
    </property>
</configuration>
EOF

cat <<EOF >/etc/hadoop/hdfs-site.xml
<configuration>
<property>
    <name>dfs.replication</name>
    <value>3</value>
</property>
</configuration>
EOF

cat <<EOF >/etc/hadoop/mapred-site.xml
<configuration>
<property>
    <name>mapreduce.framework.name</name>
    <value>yarn</value>
</property>
<property>
  <name>yarn.app.mapreduce.am.env</name>
  <value>HADOOP_MAPRED_HOME=/usr/lib/hadoop</value>
</property>
<property>
  <name>mapreduce.map.env</name>
  <value>HADOOP_MAPRED_HOME=/usr/lib/hadoop</value>
</property>
<property>
  <name>mapreduce.reduce.env</name>
  <value>HADOOP_MAPRED_HOME=/usr/lib/hadoop</value>
</property>

</configuration>
EOF

cat <<EOF >/etc/hadoop/yarn-site.xml
<configuration>
<!-- Site specific YARN configuration properties -->
    <property>
        <name>yarn.nodemanager.aux-services</name>
        <value>mapreduce_shuffle</value>
    </property>
    <property>
        <name>yarn.resourcemanager.hostname</name>
        <value>master</value>
    </property>
</configuration>
EOF

cat <<EOF >/etc/conf.d/hadoop
# example configuration file

HADOOP_USERNAME="root"

. /etc/profile.d/hadoop.sh
EOF

cat <<EOF >/etc/hadoop/workers
worker1
worker2
EOF

cat <<EOF >/etc/profile.d/hadoop.sh
export HADOOP_CONF_DIR=/etc/hadoop
export HADOOP_LOG_DIR=/tmp/hadoop/log
export HADOOP_PID_DIR=/tmp/hadoop/run

export HADOOP_USERNAME="root"

export HDFS_DATANODE_USER="root"
export HDFS_NAMENODE_USER="root"
export HDFS_SECONDARYNAMENODE_USER="root"
export YARN_RESOURCEMANAGER_USER="root"
export YARN_NODEMANAGER_USER="root"
EOF

ln -s /etc/hadoop/workers /etc/apache-spark/workers


cat <<EOF >/etc/apache-spark/spark-env.sh
#!/usr/bin/env bash
if (command -v hadoop 2> /dev/null); then
    export SPARK_DIST_CLASSPATH=\$(hadoop classpath)
else
    export SPARK_DIST_CLASSPATH=""
fi
SPARK_MASTER_IP=192.168.0.2
EOF

cat <<EOF >/etc/profile.d/java_env.sh
#!/usr/bin/env bash
export JAVA_HOME=/usr/lib/jvm/default-runtime
EOF

# Set JAVA env to java-11
archlinux-java set java-11-openjdk
