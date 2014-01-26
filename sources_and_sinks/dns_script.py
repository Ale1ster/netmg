from subprocess import check_output, CalledProcessError

for i in range(255):
    ip = '147.102.13.' + str(i)
    try:
        proc = check_output(['host'] + [ip])
        print ip + ' ' + proc.split()[-1]
    except CalledProcessError:
        print ip + ' No PTR record found'
