#!/bin/bash -e

#usings 
inspect

#shisha
dotnet_sdk="dotnet-sdk"

if snap list | grep $dotnet_sdk
then 
	echo "app '$dotnet_sdk' already installed"
	return 0
else
    sudo snap install $dotnet_sdk --classic --channel=5.0
    sudo snap alias $dotnet_sdk.dotnet dotnet
    
fi 


