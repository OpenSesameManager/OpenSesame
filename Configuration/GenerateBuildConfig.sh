#!/bin/sh

#  GenerateBuildConfig.sh
#  OpenSesame
#
#  Created by Robert Shand on 2021-09-11.
#  
echo "//Generated file please do not edit"
printf "//\n//\n//generated by GenerateBuildConfig.sh\n"
printf "import Foundation\n\n"
echo "struct OpenSesameConfig { "
echo "  fileprivate init() {}"
env |\
grep "OPENSESAME_BUILDCONFIG_" | \
sed "s/OPENSESAME_BUILDCONFIG_/    static let /" | \
sed -E 's/=(.*)/ = "\1"/' | \
sed -E 's/"http.*/URL(string:&)!/'
echo "}"
