Vim�UnDo� C��sۍ�
:�5��T�o���#�{��#bu��   >   +   notifies :run, "execute[stunnel-reload]"                             V0��    _�                             ����                                                                                                                                                                                                                                                                                                                                                             VԮ     �         <       �         <    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Vԯ     �         B      )template "/etc/cron.hourly/update-crl" do5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             VԲ     �         C      +cookbook_file "/etc/stunnel/ssl/crl.pem" do5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v       VԼ     �         D          variables :key_dir => key_dir5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v       VԿ     �         D          variables :key_dir => key_dir5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 v       V��     �         D          variables :key_dir => key_dir5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v       V��     �         D         variables :key_dir => ''5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                  v        V�A     �         D       5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                       "           V        V�o    �         D      V5�_�   	              
      +    ����                                                                                                                                                                                                                                                                                                                                                             Vַ    �         D      ,   variables :key_dir => '/etc/stunnel/ssl/'5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                       !          V       Vٺ    �                    +cookbook_file "/etc/stunnel/ssl/crl.pem" do       source "crl.pem"       owner "stunnel4"       group "stunnel4"       mode "0400"   end5�_�                    1       ����                                                                                                                                                                                                                                                                                                                                                             V0�Y     �   0   2   =      execute "stunnel-restart" do5�_�                    2   %    ����                                                                                                                                                                                                                                                                                                                                                             V0�]     �   1   3   =      &    command "service stunnel4 restart"5�_�                    )   +    ����                                                                                                                                                                                                                                                                                                                                                             V0�e     �   (   *   =      -    notifies :run, "execute[stunnel-restart]"5�_�                    .   +    ����                                                                                                                                                                                                                                                                                                                                                             V0�j     �   -   /   =      -    notifies :run, "execute[stunnel-restart]"5�_�                       )    ����                                                                                                                                                                                                                                                                                                                                                             V0��     �         =    �         =    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             V0��     �         >      ,    notifies :run, "execute[stunnel-reload]"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             V0��     �         >         source "update-crl.erb"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             V0��     �         >         mode '0700'5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             V0��     �         >         owner 'root'5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             V0��     �         >         group 'root'5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             V0��     �         >      +   variables :key_dir => '/etc/stunnel/ssl'5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             V0��    �         >      +   notifies :run, "execute[stunnel-reload]"5��