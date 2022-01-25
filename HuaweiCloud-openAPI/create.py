import base64

from huaweicloudsdkcore.auth.credentials import BasicCredentials
from huaweicloudsdkcore.exceptions import exceptions
from huaweicloudsdkecs.v2 import *
from huaweicloudsdkecs.v2.region.ecs_region import EcsRegion

from credentials import *


def create_server(server_name: str, user_data_filename: str, ip_addr: str, description: str = "", need_ip: bool = False) -> bool:
    ak = hw_ak
    sk = hw_sk

    credentials = BasicCredentials(ak, sk)

    client = EcsClient.new_builder() \
        .with_credentials(credentials) \
        .with_region(EcsRegion.value_of("cn-east-3")) \
        .build()

    try:
        request = CreateServersRequest()
        listPrePaidServerTagServerTagsServer = []
        extendparamPrePaidServerExtendParam = PrePaidServerExtendParam(
                charging_mode="0",  # on-demand
                region_id="cn-east-3"  # China shanghai 1
                )
        listPrePaidServerSecurityGroupSecurityGroupsServer = [
            PrePaidServerSecurityGroup(
                    id=hw_sys_FullAccess  # No security
                    )
            ]

        # Create disks: 40GB SSD
        listPrePaidServerDataVolumeDataVolumesServer = []
        extendparamPrePaidServerRootVolumeExtendParam = PrePaidServerRootVolumeExtendParam(
                resource_spec_code="GPSSD",
                resource_type="3"
                )
        rootVolumePrePaidServerRootVolume = PrePaidServerRootVolume(
                volumetype="GPSSD",
                size=40,
                extendparam=extendparamPrePaidServerRootVolumeExtendParam,
                hwpassthrough=False
                )
        if need_ip:
            extendparamPrePaidServerEipExtendParam = PrePaidServerEipExtendParam(
                charging_mode="postPaid"
            )
            bandwidthPrePaidServerEipBandwidth = PrePaidServerEipBandwidth(
                size=5,
                sharetype="PER",
                chargemode="traffic"
            )
            eipPrePaidServerEip = PrePaidServerEip(
                iptype="5_sbgp",
                bandwidth=bandwidthPrePaidServerEipBandwidth,
                extendparam=extendparamPrePaidServerEipExtendParam
            )
            publicipPrePaidServerPublicip = PrePaidServerPublicip(
                eip=eipPrePaidServerEip,
                delete_on_termination=True
            )
        
        listPrePaidServerNicNicsServer = [
            PrePaidServerNic(
                    subnet_id=hw_subnet_id,
                    ip_address=ip_addr
                    )
            ]

        user_script = open(user_data_filename, "r").read()
        user_data = base64.b64encode(user_script.encode("UTF-8")).decode("ASCII")

        serverPrePaidServer = PrePaidServer(
                image_ref=image, # Arch image
                flavor_ref="c6s.large.2",
                name=server_name,
                user_data=user_data,
                vpcid=hw_vpc_default,
                nics=listPrePaidServerNicNicsServer,
                publicip=publicipPrePaidServerPublicip if need_ip else None,
                count=1,
                is_auto_rename=False,
                root_volume=rootVolumePrePaidServerRootVolume,
                data_volumes=listPrePaidServerDataVolumeDataVolumesServer,
                security_groups=listPrePaidServerSecurityGroupSecurityGroupsServer,
                availability_zone="cn-east-3c",
                extendparam=extendparamPrePaidServerExtendParam,
                metadata=listPrePaidServerMetadataServer,
                server_tags=listPrePaidServerTagServerTagsServer,
                description=description
                )
        request.body = CreateServersRequestBody(
                server=serverPrePaidServer
                )
        response = client.create_servers(request)
        print(response)
        return True
    except exceptions.ClientRequestException as e:
        print(e.status_code)
        print(e.request_id)
        print(e.error_code)
        print(e.error_msg)
        return False
