localrules: bundle_refs_results, bundle_lm_results, bundle_dataset2_lm_results, bundle_wgs_results, bundle_tidal_results, bundle_kd_results, bundle_3rd_party_tfrnai_results, bundle_calderon22_results, bundle_basic_chipseq_results, bundle_csem_chipseq_results

rule bundle_refs_results:
    input:
        te_fa = refs_wf("results/tidal-anno/Tidalbase_transposon_sequence.dmel.fixed.sensechecked.fa.gz"),
        te_fai = refs_wf("results/tidal-anno/Tidalbase_transposon_sequence.dmel.fixed.sensechecked.fa.gz.fai"),
        te_gzi = refs_wf("results/tidal-anno/Tidalbase_transposon_sequence.dmel.fixed.sensechecked.fa.gz.gzi"),
        ref_ins = refs_wf("results/repeatmasker/reference_insertions.bed"),
    output:
        te_fa = "results/upstream/Tidalbase_transposon_sequence.dmel.fixed.sensechecked.fa.gz",
        te_fai = "results/upstream/Tidalbase_transposon_sequence.dmel.fixed.sensechecked.fa.gz.fai",
        te_gzi = "results/upstream/Tidalbase_transposon_sequence.dmel.fixed.sensechecked.fa.gz.gzi",
        ref_ins = "results/upstream/reference_insertions.bed",
    shell:
        """
        cp {input.te_fa} {output.te_fa}
        cp {input.te_fai} {output.te_fai}
        cp {input.te_gzi} {output.te_gzi}
        cp {input.ref_ins} {output.ref_ins}
        """
 
rule bundle_lm_results:
    input:
        lms = dgrp_coex_wf("results/linear_models/final-models.collected-info.tsv.gz"),
        male_expr = dgrp_coex_wf("results/linear_models/male/0/expression.tsv.gz"),
        female_expr = dgrp_coex_wf("results/linear_models/female/0/expression.tsv.gz"),
        raw_expression = dgrp_quant_wf("results/quantification/vanilla_salmon_tes_transcripts/se.gene.0.rds"),
    output:
        lms = "results/upstream/final-models.collected-info.tsv.gz",
        male_expr = "results/upstream/male.0.expression.tsv.gz",
        female_expr = "results/upstream/female.0.expression.tsv.gz",
        raw_expression = "results/upstream/dgrp.se.gene.0.rds",
    shell:
        """
        cp {input.lms} {output.lms}
        cp {input.male_expr} {output.male_expr}
        cp {input.female_expr} {output.female_expr}
        cp {input.raw_expression} {output.raw_expression}
        """

rule bundle_dataset2_lm_results:
    input:
        lms_d2 = dgrp_coex_d2_wf("results/linear_models/final-models.collected-info.tsv.gz"),
    output:
        lms_d2 = "results/upstream/final-models.d2.collected-info.tsv.gz",
    shell:
        """
        cp {input.lms_d2} {output.lms_d2}
        """

rule bundle_wgs_results:
    input:
        copies = wgs_wf("results/copies/copies.tsv"),
    output:
        copies = "results/upstream/copies.tsv",
    shell:
        """
        cp {input.copies} {output.copies}
        """

rule bundle_tidal_results:
    input:
        overlaps = tidal_wf("results/overlaps/overlaps.tsv.gz"),
        dgrp_ins = tidal_wf("results/collected_insertions/DGRP_flies.tsv"),
        bb_insertions = tidal_wf("results/beds/dgrp_tidal_insertions.bb"),
        bb_uniq_insertions = tidal_wf("results/beds/dgrp_tidal_insertions.unique.bb"),
    output:
        overlaps = "results/upstream/overlaps.tsv.gz",
        dgrp_ins = "results/upstream/DGRP_flies.tsv",
        bb_insertions = "results/upstream/dgrp_tidal_insertions.bb",
        bb_uniq_insertions = "results/upstream/dgrp_tidal_insertions.unique.bb",
    shell:
        """
        cp {input.overlaps} {output.overlaps}
        cp {input.dgrp_ins} {output.dgrp_ins}
        cp {input.bb_insertions} {output.bb_insertions}
        cp {input.bb_uniq_insertions} {output.bb_uniq_insertions}
        """

rule bundle_kd_results:
    input:
        rep_kd_se = kd_rna_wf("results/quantification/vanilla_salmon_tes_transcripts/se.gene.0.rds"),
    output:
        rep_kd_se = "results/upstream/kd.se.gene.0.rds",
    shell:
        """
        cp {input.rep_kd_se} {output.rep_kd_se}
        """

rule bundle_3rd_party_tfrnai_results:
    input:
        rep_tfrnai_se = tfrnai_wf("results/quantification/vanilla_salmon_tes_transcripts/se.gene.0.rds"),
    output:
        rep_tfrnai_se = "results/upstream/tfrnai.se.gene.0.rds",
    shell:
        """
        cp {input.rep_tfrnai_se} {output.rep_tfrnai_se}
        """

rule bundle_calderon22_results:
    input:
        supercells = calderon22_wf("results/supercell/supercells.rds"),
        calderon_te_lookup = calderon22_wf("results/resources/te_element_lookup.json"),
    output:
        supercells = "results/upstream/calderon22_supercells.rds",
        calderon_te_lookup = "results/upstream/te_element_lookup.json",
    shell:
        """
        cp {input.supercells} {output.supercells}
        cp {input.calderon_te_lookup} {output.calderon_te_lookup}
        """

rule bundle_basic_chipseq_results:
    input:
        chip_masked_idxstats = basic_chip_wf("results/basic_chip/qc/masked/all_idxstats.txt"),
        chip_unmasked_stats = basic_chip_wf("results/basic_chip/qc/unmasked/all_stats.txt"),
        chip_fingerprint = basic_chip_wf("results/basic_chip/qc/masked/all_fingerprint.metrics.txt"),
    output:
        chip_masked_idxstats = "results/upstream/masked_idxstats.txt",
        chip_unmasked_stats = "results/upstream/unmasked_all_stats.txt",
        chip_fingerprint = "results/upstream/masked_all_fingerprint.metrics.txt",
    shell:
        """
        cp {input.chip_masked_idxstats} {output.chip_masked_idxstats}
        cp {input.chip_unmasked_stats} {output.chip_unmasked_stats}
        cp {input.chip_fingerprint} {output.chip_fingerprint}
        """

rule bundle_csem_chipseq_results:
    input:
        mosaics = "subworkflows/tetf_csem_mosaics/results/csem_mosaics/mosaics/",
        bigwigs = "subworkflows/tetf_csem_mosaics/results/csem_mosaics/viz/",
        sea = "subworkflows/tetf_csem_mosaics/results/csem_mosaics/motifs/sea/",
    output:
        mosaics = directory("results/upstream/csem_mosaics/mosaics/"),
        bigwigs = directory("results/upstream/csem_mosaics/bigwigs/"),
        sea = directory("results/upstream/csem_mosaics/sea/"),
    shell:
        """
        mkdir -p {output.mosaics}
        mkdir -p {output.bigwigs}
        mkdir -p {output.sea}
        cp -r {input.mosaics} {output.mosaics}
        cp {input.bigwigs}/*log2ratio.bw {output.bigwigs}
        cp -r {input.sea} {output.sea}
        """