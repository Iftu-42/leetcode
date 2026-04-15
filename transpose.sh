awk '
{
    for (i = 1; i <= NF; i++) {
        arr[i, NR] = $i
    }
}

END {
    for (i = 1; i <= NF; i++) {
        for (j = 1; j <= NR; j++) {
            printf arr[i, j]
            if (j < NR) printf " "
        }
        print ""
    }
}
' file.txt
