#!/usr/bin/perl
 
$first = 1; 
print "{\n";
print "\t\"data\":[\n\n";
 
for (`source /root/openrc ;nova list --all-tenant --fields name| grep -v -w ID | grep -v "+--"`)
#for (`source /root/openrc ;nova list --all-tenant --fields name,status | sed 's/\|/ /g' ` )
{
   
    ($vmid,$vmname) = m/\S+ (\S+) \S+ (\S+)/;
    print "\t,\n" if not $first;
    $first = 0;
 
    print "\t{\n";
    print "\t\t\"{#VMNAMEID}\":\"$vmname:$vmid\"\n";
    print "\t}\n";
}
 
print "\n\t]\n";
print "}\n";
