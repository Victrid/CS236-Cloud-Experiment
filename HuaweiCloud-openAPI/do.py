#!/bin/python

# cc2021 
# Copyright (C) 2022  Weihao Jiang <weihao.jiang@sjtu.edu.cn>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
import create

create.create_server("master", "config.sh", "192.168.0.2", "Master node", need_ip=True)
create.create_server("worker1", "config.sh", "192.168.0.3", "Worker 1 node")
create.create_server("worker2", "config.sh", "192.168.0.4", "Worker 2 node")
