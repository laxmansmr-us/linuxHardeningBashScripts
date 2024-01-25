# linuxHardeningBashScripts
This Project include Linux Hardening Bash scripts based on CIS benchmarks 
</br>

1- combine all script in one script, Or use Amazon SSM Json script
2- Then use the follwoing command to fetch the faild hardening steps:
```bash
grep -i "failed" /var/log/path/hardening.log
```