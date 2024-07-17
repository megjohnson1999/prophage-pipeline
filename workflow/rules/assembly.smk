rule spades:
    input:
        hr1 = "reads/host_removed/{sample}_1_hr.fastq.gz",
        hr2 = "reads/host_removed/{sample}_2_hr.fastq.gz",
    threads: 8
    conda: "../envs/spades_env.yml"
    output:
        dir = directory("out/{sample}/assembly"),
        contigs = "out/{sample}/assembly/contigs.fasta"
    log:
        "logs/spades/{sample}.log"
    shell:
        """
        spades.py --meta -m 400 -t {threads} -1 {input.hr1} -2 {input.hr2} -o {output.dir} &>> {log}
        """
