.GT_REFCLK0(gt_refclk1_out),

.apb3clk(iffctrlq3apb3clk),
.axisclk(iffctrlq3axisclk),

.apb3psel(iffctrlq3psel),
.apb3paddr(iffctrlq3paddr),
.apb3prdata(iffctrlq3prdata),
.apb3pready(iffctrlq3pready),
.apb3pwdata(iffctrlq3pwdata),
.apb3pwrite(iffctrlq3pwrite),
.apb3penable(iffctrlq3penable),
.apb3presetn(iffctrlq3presetn),
.apb3pslverr(iffctrlq3pslverr),

.bgpdb(iffctrlq3bgpwrdnb),
.bgbypassb(iffctrlq3bgbypass),
.bgrcalovrd(iffctrlq3bgrcalctl),
.bgmonitorenb(iffctrlq3bgtesten),
.bgrcalovrdenb(iffctrlq3bgrcalovrdenb),

.ch0_rxdata(iffcq30rxdata),
.ch0_rxrate(iffcq30rxrate),
.ch0_txdata(iffcq30txdata),
.ch0_txrate(iffcq30txrate),
.ch0_bufgtce(iffcq30bufgtce),
.ch0_gtrsvd(iffcq30pinrsrvd),
.ch0_pcierstb(iffcq30perstb),
.ch0_rxctrl0(iffcq30rxctrl0),
.ch0_rxctrl1(iffcq30rxctrl1),
.ch0_rxctrl2(iffcq30rxctrl2),
.ch0_rxctrl3(iffcq30rxctrl3),
.ch0_rxlpmen(iffcq30rxlpmen),
.ch0_rxpkdet(q3_ch0_rxpkdet),
.ch0_rxqpien(iffcq30rxqpien),
.ch0_rxslide(iffcq30rxslide),
.ch0_rxvalid(iffcq30rxvalid),
.ch0_tstclk0(iffcq30tstclk0),
.ch0_tstclk1(iffcq30tstclk1),
.ch0_txctrl0(iffcq30txctrl0),
.ch0_txctrl1(iffcq30txctrl1),
.ch0_txctrl2(iffcq30txctrl2),
.ch0_txpippmen(iffcq30enppm),
.ch0_txswing(iffcq30txswing),
.ch0_rxpd(iffcq30rxpowerdown),
.ch0_txpd(iffcq30txpowerdown),
.ch0_bufgtdiv(iffcq30bufgtdiv),
.ch0_bufgtrst(iffcq30bufgtrst),
.ch0_iloreset(iffcq30iloreset),
.ch0_loopback(iffcq30loopback),
.ch0_phyready(iffcq30phyready),
.ch0_rxcdrhold(iffcq30cdrhold),
.ch0_rxcdrlock(iffcq30cdrlock),
.ch0_rxheader(iffcq30rxheader),
.ch0_rxlatclk(iffcq30rxlatclk),
.ch0_rxoutclk(q3_ch0_rxoutclk),
.ch0_rxstatus(iffcq30rxstatus),
.ch0_rxusrclk(iffcq30rxusrclk),
.ch0_txcomsas(iffcq30txcomsas),
.ch0_txdeemph(iffcq30txdeemph),
.ch0_txheader(iffcq30txheader),
.ch0_txlatclk(iffcq30txlatclk),
.ch0_txmargin(iffcq30txmargin),
.ch0_txoutclk(q3_ch0_txoutclk),
.ch0_txusrclk(iffcq30txusrclk),
.ch0_dfehold(iffcq30aptexthold),
.ch0_rxuserrdy(iffcq30rxusrrdy),
.ch0_txuserrdy(iffcq30txusrrdy),
.ch0_cdrfreqos(iffcq30cdrfreqos),
.ch0_cdrstepsq(iffcq30cdrstepsq),
.ch0_cdrstepsx(iffcq30cdrstepsx),
.ch0_dfeovrd(iffcq30aptoverwren),
.ch0_dmonitorclk(iffcq30dmonclk),
.ch0_dmonitorout(iffcq30dmonout),
.ch0_gtrxreset(iffcq30gtrxreset),
.ch0_gttxreset(iffcq30gttxreset),
.ch0_pcsrsvdin(iffcq30pcsrsvdin),
.ch0_phystatus(iffcq30phystatus),
.ch0_rxchbondi(iffcq30rxchbondi),
.ch0_rxchbondo(iffcq30rxchbondo),
.ch0_rxprbserr(iffcq30rxprbserr),
.ch0_rxprbssel(iffcq30rxprbssel),
.ch0_rxqpisenn(iffcq30rxqpisenn),
.ch0_rxqpisenp(iffcq30rxqpisenp),
.ch0_txcominit(iffcq30txcominit),
.ch0_txcomwake(iffcq30txcomwake),
.ch0_txdccdone(iffcq30txdccdone),
.ch0_txdiffctrl(iffcq30txdrvamp),
.ch0_txinhibit(iffcq30txinhibit),
.ch0_txpisopd(iffcq30txserpwrdn),
.ch0_txprbssel(iffcq30txprbssel),
.ch0_txqpisenn(iffcq30txqpisenn),
.ch0_txqpisenp(iffcq30txqpisenp),
.ch0_clkrsvd0(iffcq30ckpinrsrvd0),
.ch0_clkrsvd1(iffcq30ckpinrsrvd1),
.ch0_pinrsvdas(iffcq30pinrsrvdas),
.ch0_rxcdrovrden(iffcq30cdrovren),
.ch0_rxosintdone(iffcq30cfokdone),
.ch0_txprecursor(iffcq30txemppre),
.ch0_cdrstepdir(iffcq30cdrstepdir),
.ch0_pcsrsvdout(iffcq30pcsrsvdout),
.ch0_refdebugout(iffcq30refclkpma),
.ch0_rxcdrreset(iffcq30cdrphreset),
.ch0_rxcommadet(iffcq30rxcommadet),
.ch0_rxcomsasdet(iffcq30comsasdet),
.ch0_rxelecidle(iffcq30rxelecidle),
.ch0_rxoobreset(iffcq30rxoobreset),
.ch0_rxpolarity(iffcq30rxpolarity),
.ch0_rxsliderdy(iffcq30rxsliderdy),
.ch0_rxslipdone(iffcq30rxslipdone),
.ch0_rxsyncdone(iffcq30rxsyncdone),
.ch0_txelecidle(iffcq30txelecidle),
.ch0_txpolarity(iffcq30txpolarity),
.ch0_txpostcursor(iffcq30txemppos),
.ch0_txsequence(iffcq30txsequence),
.ch0_txsyncdone(iffcq30txsyncdone),
.ch0_cdrbmcdrreq(iffcq30cdrbmcdreq),
.ch0_rxclkcorcnt(iffcq30rxckcorcnt),
.ch0_txmaincursor(iffcq30txempmain),
.ch0_bufgtcemask(iffcq30bufgtcemask),
.ch0_cdrincpctrl(iffcq30cdrincpctrl),
.ch0_rxbufstatus(iffcq30rxbufstatus),
.ch0_rxcdrphdone(iffcq30rxcdrphdone),
.ch0_rxcominitdet(iffcq30cominitdet),
.ch0_rxcomwakedet(iffcq30comwakedet),
.ch0_rxdapireset(iffcq30rxdapireset),
.ch0_rxdatavalid(iffcq30rxdatavalid),
.ch0_rxresetdone(iffcq30rxresetdone),
.ch0_rxresetmode(iffcq30rxresetmode),
.ch0_rxsyncallin(iffcq30rxsyncallin),
.ch0_txbufstatus(iffcq30txbufstatus),
.ch0_txcomfinish(iffcq30txcomfinish),
.ch0_txdapireset(iffcq30txdapireset),
.ch0_txoneszeros(iffcq30txoneszeros),
.ch0_txqpibiasen(iffcq30txqpibiasen),
.ch0_txqpiweakpu(iffcq30txqpiweakpu),
.ch0_txresetdone(iffcq30txresetdone),
.ch0_txresetmode(iffcq30txresetmode),
.ch0_txsyncallin(iffcq30txsyncallin),
.ch0_rxphdlypd(iffcq30rxphasealignpd),
.ch0_txphdlypd(iffcq30txphasealignpd),
.ch0_bufgtrstmask(iffcq30bufgtrstmask),
.ch0_eyescanreset(iffcq30eyescanreset),
.ch0_hsdppcsreset(iffcq30hsdppcsreset),
.ch0_iloresetdone(iffcq30iloresetdone),
.ch0_iloresetmask(iffcq30iloresetmask),
.ch0_rxdebugpcsout(iffcq30rxoutpcsclk),
.ch0_rxeqtraining(iffcq30rxeqtraining),
.ch0_rxphdlyreset(iffcq30rxphdlyreset),
.ch0_rxprbslocked(iffcq30rxprbslocked),
.ch0_rxstartofseq(iffcq30rxstartofseq),
.ch0_txdebugpcsout(iffcq30txoutpcsclk),
.ch0_txphdlyreset(iffcq30txphdlyreset),
.ch0_rxmstreset(iffctrlq3mstrxreset[0]),
.ch0_txmstreset(iffctrlq3msttxreset[0]),
.ch0_dmonfiforeset(iffcq30dmonfiforeset),
.ch0_rx10gstat(iffcq30rxethernetstatout),
.ch0_rxbyterealign(q3_ch0_rxbyterealign),
.ch0_rxchanbondseq(iffcq30rxchanbondseq),
.ch0_rxchanrealign(iffcq30rxchanrealign),
.ch0_rxgearboxslip(iffcq30rxgearboxslip),
.ch0_rxheadervalid(iffcq30rxheadervalid),
.ch0_rxmldchainreq(iffcq30rxmldchainreq),
.ch0_rxtermination(iffcq30rxtermination),
.ch0_txmldchainreq(iffcq30txmldchainreq),
.ch0_txpippmstepsize(iffcq30stepsizeppm),
.ch0_txswingoutlow(iffcq30txswingoutlow),
.ch0_rxphalignerr(iffcq30rxphasealignerr),
.ch0_rxphalignreq(iffcq30rxphasealignreq),
.ch0_txphalignerr(iffcq30txphasealignerr),
.ch0_txphalignreq(iffcq30txphasealignreq),
.ch0_txphdlytstclk(iffcq30tcoclkfsmfrout),
.ch0_dmonitoroutclk(q3_ch0_dmonitoroutclk),
.ch0_eyescantrigger(iffcq30eyescantrigger),
.ch0_resetexception(iffcq30resetexception),
.ch0_rxchanisaligned(iffcq30rxchisaligned),
.ch0_rxdlyalignerr(iffcq30rxdelayalignerr),
.ch0_rxdlyalignreq(iffcq30rxdelayalignreq),
.ch0_rxmldchaindone(iffcq30rxmldchaindone),
.ch0_rxpcsresetmask(iffcq30rxpcsresetmask),
.ch0_rxpmaresetdone(iffcq30rxpmaresetdone),
.ch0_rxpmaresetmask(iffcq30rxpmaresetmask),
.ch0_rxprbscntreset(iffcq30rxprbscntreset),
.ch0_rxprogdivreset(iffcq30rxprogdivreset),
.ch0_txdetectrx(iffcq30txdetectrxloopback),
.ch0_txdlyalignerr(iffcq30txdelayalignerr),
.ch0_txdlyalignreq(iffcq30txdelayalignreq),
.ch0_txmldchaindone(iffcq30txmldchaindone),
.ch0_txpcsresetmask(iffcq30txpcsresetmask),
.ch0_txpicodereset(iffcq30txtxpicodereset),
.ch0_txpmaresetdone(iffcq30txpmaresetdone),
.ch0_txpmaresetmask(iffcq30txpmaresetmask),
.ch0_txprbsforceerr(iffcq30txprbsforceerr),
.ch0_txprogdivreset(iffcq30txprogdivreset),
.ch0_txswingouthigh(iffcq30txswingouthigh),
.ch0_rxphaligndone(iffcq30rxphasealigndone),
.ch0_txphaligndone(iffcq30txphasealigndone),
.ch0_rxbyteisaligned(iffcq30rxbyteisaligned),
.ch0_rxdapicodereset(iffcq30rxdapicodereset),
.ch0_rxdapiresetdone(iffcq30rxdapiresetdone),
.ch0_rxdapiresetmask(iffcq30rxdapiresetmask),
.ch0_rxfinealigndone(iffcq30rxfinealigndone),
.ch0_rxphshift180(iffcq30rxphaseshift180req),
.ch0_txdapicodereset(iffcq30txdapicodereset),
.ch0_txdapiresetdone(iffcq30txdapiresetdone),
.ch0_txdapiresetmask(iffcq30txdapiresetmask),
.ch0_txphalignoutrsvd(iffcq30txchicooutrsvd),
.ch0_txphshift180(iffcq30txphaseshift180req),
.ch0_txpicodeovrden(iffcq30txtxpicodeovrden),
.ch0_rxphsetinitreq(iffcq30rxphasesetinitreq),
.ch0_txphsetinitreq(iffcq30txphasesetinitreq),
.ch0_eyescandataerror(iffcq30eyescandataerror),
.ch0_rxdapicodeovrden(iffcq30rxdapicodeovrden),
.ch0_rxmlfinealignreq(iffcq30rxmlfinealignreq),
.ch0_txdapicodeovrden(iffcq30txdapicodeovrden),
.ch0_rxmstresetdone(iffctrlq3mstrxresetdone[0]),
.ch0_rxphsetinitdone(iffcq30rxphasesetinitdone),
.ch0_txmstresetdone(iffctrlq3msttxresetdone[0]),
.ch0_txphsetinitdone(iffcq30txphasesetinitdone),
.ch0_rxdlyalignprog(iffcq30rxdelayalignprogress),
.ch0_rxphalignresetmask(iffcq30rxchicoresetmask),
.ch0_txdlyalignprog(iffcq30txdelayalignprogress),
.ch0_txpausedelayalign(iffcq30txpausedelayalign),
.ch0_txphalignresetmask(iffcq30txchicoresetmask),
.ch0_xpipe5_pipeline_en(iffcq30xpipe5pipelineen),
.ch0_phyesmadaptsave(iffcq30phyesmadaptationsave),
.ch0_rxphshift180done(iffcq30rxphaseshift180done),
.ch0_tx10gstat(iffcq30txethernetstattxlocalfault),
.ch0_txphshift180done(iffcq30txphaseshift180done),
.ch0_rxprogdivresetdone(iffcq30rxprogdivresetdone),
.ch0_rxsimplexphystatus(iffcq30rxsimplexphystatus),
.ch0_txprogdivresetdone(iffcq30txprogdivresetdone),
.ch0_txsimplexphystatus(iffcq30txsimplexphystatus),
.ch0_rxphdlyresetdone(iffcq30rxphasedelayresetdone),
.ch0_txphdlyresetdone(iffcq30txphasedelayresetdone),

.ch1_rxdata(iffcq31rxdata),
.ch1_rxrate(iffcq31rxrate),
.ch1_txdata(iffcq31txdata),
.ch1_txrate(iffcq31txrate),
.ch1_bufgtce(iffcq31bufgtce),
.ch1_gtrsvd(iffcq31pinrsrvd),
.ch1_pcierstb(iffcq31perstb),
.ch1_rxctrl0(iffcq31rxctrl0),
.ch1_rxctrl1(iffcq31rxctrl1),
.ch1_rxctrl2(iffcq31rxctrl2),
.ch1_rxctrl3(iffcq31rxctrl3),
.ch1_rxlpmen(iffcq31rxlpmen),
.ch1_rxpkdet(q3_ch1_rxpkdet),
.ch1_rxqpien(iffcq31rxqpien),
.ch1_rxslide(iffcq31rxslide),
.ch1_rxvalid(iffcq31rxvalid),
.ch1_tstclk0(iffcq31tstclk0),
.ch1_tstclk1(iffcq31tstclk1),
.ch1_txctrl0(iffcq31txctrl0),
.ch1_txctrl1(iffcq31txctrl1),
.ch1_txctrl2(iffcq31txctrl2),
.ch1_txpippmen(iffcq31enppm),
.ch1_txswing(iffcq31txswing),
.ch1_rxpd(iffcq31rxpowerdown),
.ch1_txpd(iffcq31txpowerdown),
.ch1_bufgtdiv(iffcq31bufgtdiv),
.ch1_bufgtrst(iffcq31bufgtrst),
.ch1_iloreset(iffcq31iloreset),
.ch1_loopback(iffcq31loopback),
.ch1_phyready(iffcq31phyready),
.ch1_rxcdrhold(iffcq31cdrhold),
.ch1_rxcdrlock(iffcq31cdrlock),
.ch1_rxheader(iffcq31rxheader),
.ch1_rxlatclk(iffcq31rxlatclk),
.ch1_rxoutclk(q3_ch1_rxoutclk),
.ch1_rxstatus(iffcq31rxstatus),
.ch1_rxusrclk(iffcq31rxusrclk),
.ch1_txcomsas(iffcq31txcomsas),
.ch1_txdeemph(iffcq31txdeemph),
.ch1_txheader(iffcq31txheader),
.ch1_txlatclk(iffcq31txlatclk),
.ch1_txmargin(iffcq31txmargin),
.ch1_txoutclk(q3_ch1_txoutclk),
.ch1_txusrclk(iffcq31txusrclk),
.ch1_dfehold(iffcq31aptexthold),
.ch1_rxuserrdy(iffcq31rxusrrdy),
.ch1_txuserrdy(iffcq31txusrrdy),
.ch1_cdrfreqos(iffcq31cdrfreqos),
.ch1_cdrstepsq(iffcq31cdrstepsq),
.ch1_cdrstepsx(iffcq31cdrstepsx),
.ch1_dfeovrd(iffcq31aptoverwren),
.ch1_dmonitorclk(iffcq31dmonclk),
.ch1_dmonitorout(iffcq31dmonout),
.ch1_gtrxreset(iffcq31gtrxreset),
.ch1_gttxreset(iffcq31gttxreset),
.ch1_pcsrsvdin(iffcq31pcsrsvdin),
.ch1_phystatus(iffcq31phystatus),
.ch1_rxchbondi(iffcq31rxchbondi),
.ch1_rxchbondo(iffcq31rxchbondo),
.ch1_rxprbserr(iffcq31rxprbserr),
.ch1_rxprbssel(iffcq31rxprbssel),
.ch1_rxqpisenn(iffcq31rxqpisenn),
.ch1_rxqpisenp(iffcq31rxqpisenp),
.ch1_txcominit(iffcq31txcominit),
.ch1_txcomwake(iffcq31txcomwake),
.ch1_txdccdone(iffcq31txdccdone),
.ch1_txdiffctrl(iffcq31txdrvamp),
.ch1_txinhibit(iffcq31txinhibit),
.ch1_txpisopd(iffcq31txserpwrdn),
.ch1_txprbssel(iffcq31txprbssel),
.ch1_txqpisenn(iffcq31txqpisenn),
.ch1_txqpisenp(iffcq31txqpisenp),
.ch1_clkrsvd0(iffcq31ckpinrsrvd0),
.ch1_clkrsvd1(iffcq31ckpinrsrvd1),
.ch1_pinrsvdas(iffcq31pinrsrvdas),
.ch1_rxcdrovrden(iffcq31cdrovren),
.ch1_rxosintdone(iffcq31cfokdone),
.ch1_txprecursor(iffcq31txemppre),
.ch1_cdrstepdir(iffcq31cdrstepdir),
.ch1_pcsrsvdout(iffcq31pcsrsvdout),
.ch1_refdebugout(iffcq31refclkpma),
.ch1_rxcdrreset(iffcq31cdrphreset),
.ch1_rxcommadet(iffcq31rxcommadet),
.ch1_rxcomsasdet(iffcq31comsasdet),
.ch1_rxelecidle(iffcq31rxelecidle),
.ch1_rxoobreset(iffcq31rxoobreset),
.ch1_rxpolarity(iffcq31rxpolarity),
.ch1_rxsliderdy(iffcq31rxsliderdy),
.ch1_rxslipdone(iffcq31rxslipdone),
.ch1_rxsyncdone(iffcq31rxsyncdone),
.ch1_txelecidle(iffcq31txelecidle),
.ch1_txpolarity(iffcq31txpolarity),
.ch1_txpostcursor(iffcq31txemppos),
.ch1_txsequence(iffcq31txsequence),
.ch1_txsyncdone(iffcq31txsyncdone),
.ch1_cdrbmcdrreq(iffcq31cdrbmcdreq),
.ch1_rxclkcorcnt(iffcq31rxckcorcnt),
.ch1_txmaincursor(iffcq31txempmain),
.ch1_bufgtcemask(iffcq31bufgtcemask),
.ch1_cdrincpctrl(iffcq31cdrincpctrl),
.ch1_rxbufstatus(iffcq31rxbufstatus),
.ch1_rxcdrphdone(iffcq31rxcdrphdone),
.ch1_rxcominitdet(iffcq31cominitdet),
.ch1_rxcomwakedet(iffcq31comwakedet),
.ch1_rxdapireset(iffcq31rxdapireset),
.ch1_rxdatavalid(iffcq31rxdatavalid),
.ch1_rxresetdone(iffcq31rxresetdone),
.ch1_rxresetmode(iffcq31rxresetmode),
.ch1_rxsyncallin(iffcq31rxsyncallin),
.ch1_txbufstatus(iffcq31txbufstatus),
.ch1_txcomfinish(iffcq31txcomfinish),
.ch1_txdapireset(iffcq31txdapireset),
.ch1_txoneszeros(iffcq31txoneszeros),
.ch1_txqpibiasen(iffcq31txqpibiasen),
.ch1_txqpiweakpu(iffcq31txqpiweakpu),
.ch1_txresetdone(iffcq31txresetdone),
.ch1_txresetmode(iffcq31txresetmode),
.ch1_txsyncallin(iffcq31txsyncallin),
.ch1_rxphdlypd(iffcq31rxphasealignpd),
.ch1_txphdlypd(iffcq31txphasealignpd),
.ch1_bufgtrstmask(iffcq31bufgtrstmask),
.ch1_eyescanreset(iffcq31eyescanreset),
.ch1_hsdppcsreset(iffcq31hsdppcsreset),
.ch1_iloresetdone(iffcq31iloresetdone),
.ch1_iloresetmask(iffcq31iloresetmask),
.ch1_rxdebugpcsout(iffcq31rxoutpcsclk),
.ch1_rxeqtraining(iffcq31rxeqtraining),
.ch1_rxphdlyreset(iffcq31rxphdlyreset),
.ch1_rxprbslocked(iffcq31rxprbslocked),
.ch1_rxstartofseq(iffcq31rxstartofseq),
.ch1_txdebugpcsout(iffcq31txoutpcsclk),
.ch1_txphdlyreset(iffcq31txphdlyreset),
.ch1_rxmstreset(iffctrlq3mstrxreset[1]),
.ch1_txmstreset(iffctrlq3msttxreset[1]),
.ch1_dmonfiforeset(iffcq31dmonfiforeset),
.ch1_rx10gstat(iffcq31rxethernetstatout),
.ch1_rxbyterealign(q3_ch1_rxbyterealign),
.ch1_rxchanbondseq(iffcq31rxchanbondseq),
.ch1_rxchanrealign(iffcq31rxchanrealign),
.ch1_rxgearboxslip(iffcq31rxgearboxslip),
.ch1_rxheadervalid(iffcq31rxheadervalid),
.ch1_rxmldchainreq(iffcq31rxmldchainreq),
.ch1_rxtermination(iffcq31rxtermination),
.ch1_txmldchainreq(iffcq31txmldchainreq),
.ch1_txpippmstepsize(iffcq31stepsizeppm),
.ch1_txswingoutlow(iffcq31txswingoutlow),
.ch1_rxphalignerr(iffcq31rxphasealignerr),
.ch1_rxphalignreq(iffcq31rxphasealignreq),
.ch1_txphalignerr(iffcq31txphasealignerr),
.ch1_txphalignreq(iffcq31txphasealignreq),
.ch1_txphdlytstclk(iffcq31tcoclkfsmfrout),
.ch1_dmonitoroutclk(q3_ch1_dmonitoroutclk),
.ch1_eyescantrigger(iffcq31eyescantrigger),
.ch1_resetexception(iffcq31resetexception),
.ch1_rxchanisaligned(iffcq31rxchisaligned),
.ch1_rxdlyalignerr(iffcq31rxdelayalignerr),
.ch1_rxdlyalignreq(iffcq31rxdelayalignreq),
.ch1_rxmldchaindone(iffcq31rxmldchaindone),
.ch1_rxpcsresetmask(iffcq31rxpcsresetmask),
.ch1_rxpmaresetdone(iffcq31rxpmaresetdone),
.ch1_rxpmaresetmask(iffcq31rxpmaresetmask),
.ch1_rxprbscntreset(iffcq31rxprbscntreset),
.ch1_rxprogdivreset(iffcq31rxprogdivreset),
.ch1_txdetectrx(iffcq31txdetectrxloopback),
.ch1_txdlyalignerr(iffcq31txdelayalignerr),
.ch1_txdlyalignreq(iffcq31txdelayalignreq),
.ch1_txmldchaindone(iffcq31txmldchaindone),
.ch1_txpcsresetmask(iffcq31txpcsresetmask),
.ch1_txpicodereset(iffcq31txtxpicodereset),
.ch1_txpmaresetdone(iffcq31txpmaresetdone),
.ch1_txpmaresetmask(iffcq31txpmaresetmask),
.ch1_txprbsforceerr(iffcq31txprbsforceerr),
.ch1_txprogdivreset(iffcq31txprogdivreset),
.ch1_txswingouthigh(iffcq31txswingouthigh),
.ch1_rxphaligndone(iffcq31rxphasealigndone),
.ch1_txphaligndone(iffcq31txphasealigndone),
.ch1_rxbyteisaligned(iffcq31rxbyteisaligned),
.ch1_rxdapicodereset(iffcq31rxdapicodereset),
.ch1_rxdapiresetdone(iffcq31rxdapiresetdone),
.ch1_rxdapiresetmask(iffcq31rxdapiresetmask),
.ch1_rxfinealigndone(iffcq31rxfinealigndone),
.ch1_rxphshift180(iffcq31rxphaseshift180req),
.ch1_txdapicodereset(iffcq31txdapicodereset),
.ch1_txdapiresetdone(iffcq31txdapiresetdone),
.ch1_txdapiresetmask(iffcq31txdapiresetmask),
.ch1_txphalignoutrsvd(iffcq31txchicooutrsvd),
.ch1_txphshift180(iffcq31txphaseshift180req),
.ch1_txpicodeovrden(iffcq31txtxpicodeovrden),
.ch1_rxphsetinitreq(iffcq31rxphasesetinitreq),
.ch1_txphsetinitreq(iffcq31txphasesetinitreq),
.ch1_eyescandataerror(iffcq31eyescandataerror),
.ch1_rxdapicodeovrden(iffcq31rxdapicodeovrden),
.ch1_rxmlfinealignreq(iffcq31rxmlfinealignreq),
.ch1_txdapicodeovrden(iffcq31txdapicodeovrden),
.ch1_rxmstresetdone(iffctrlq3mstrxresetdone[1]),
.ch1_rxphsetinitdone(iffcq31rxphasesetinitdone),
.ch1_txmstresetdone(iffctrlq3msttxresetdone[1]),
.ch1_txphsetinitdone(iffcq31txphasesetinitdone),
.ch1_rxdlyalignprog(iffcq31rxdelayalignprogress),
.ch1_rxphalignresetmask(iffcq31rxchicoresetmask),
.ch1_txdlyalignprog(iffcq31txdelayalignprogress),
.ch1_txpausedelayalign(iffcq31txpausedelayalign),
.ch1_txphalignresetmask(iffcq31txchicoresetmask),
.ch1_xpipe5_pipeline_en(iffcq31xpipe5pipelineen),
.ch1_phyesmadaptsave(iffcq31phyesmadaptationsave),
.ch1_rxphshift180done(iffcq31rxphaseshift180done),
.ch1_tx10gstat(iffcq31txethernetstattxlocalfault),
.ch1_txphshift180done(iffcq31txphaseshift180done),
.ch1_rxprogdivresetdone(iffcq31rxprogdivresetdone),
.ch1_rxsimplexphystatus(iffcq31rxsimplexphystatus),
.ch1_txprogdivresetdone(iffcq31txprogdivresetdone),
.ch1_txsimplexphystatus(iffcq31txsimplexphystatus),
.ch1_rxphdlyresetdone(iffcq31rxphasedelayresetdone),
.ch1_txphdlyresetdone(iffcq31txphasedelayresetdone),

.ch2_rxdata(iffcq32rxdata),
.ch2_rxrate(iffcq32rxrate),
.ch2_txdata(iffcq32txdata),
.ch2_txrate(iffcq32txrate),
.ch2_bufgtce(iffcq32bufgtce),
.ch2_gtrsvd(iffcq32pinrsrvd),
.ch2_pcierstb(iffcq32perstb),
.ch2_rxctrl0(iffcq32rxctrl0),
.ch2_rxctrl1(iffcq32rxctrl1),
.ch2_rxctrl2(iffcq32rxctrl2),
.ch2_rxctrl3(iffcq32rxctrl3),
.ch2_rxlpmen(iffcq32rxlpmen),
.ch2_rxpkdet(q3_ch2_rxpkdet),
.ch2_rxqpien(iffcq32rxqpien),
.ch2_rxslide(iffcq32rxslide),
.ch2_rxvalid(iffcq32rxvalid),
.ch2_tstclk0(iffcq32tstclk0),
.ch2_tstclk1(iffcq32tstclk1),
.ch2_txctrl0(iffcq32txctrl0),
.ch2_txctrl1(iffcq32txctrl1),
.ch2_txctrl2(iffcq32txctrl2),
.ch2_txpippmen(iffcq32enppm),
.ch2_txswing(iffcq32txswing),
.ch2_rxpd(iffcq32rxpowerdown),
.ch2_txpd(iffcq32txpowerdown),
.ch2_bufgtdiv(iffcq32bufgtdiv),
.ch2_bufgtrst(iffcq32bufgtrst),
.ch2_iloreset(iffcq32iloreset),
.ch2_loopback(iffcq32loopback),
.ch2_phyready(iffcq32phyready),
.ch2_rxcdrhold(iffcq32cdrhold),
.ch2_rxcdrlock(iffcq32cdrlock),
.ch2_rxheader(iffcq32rxheader),
.ch2_rxlatclk(iffcq32rxlatclk),
.ch2_rxoutclk(q3_ch2_rxoutclk),
.ch2_rxstatus(iffcq32rxstatus),
.ch2_rxusrclk(iffcq32rxusrclk),
.ch2_txcomsas(iffcq32txcomsas),
.ch2_txdeemph(iffcq32txdeemph),
.ch2_txheader(iffcq32txheader),
.ch2_txlatclk(iffcq32txlatclk),
.ch2_txmargin(iffcq32txmargin),
.ch2_txoutclk(q3_ch2_txoutclk),
.ch2_txusrclk(iffcq32txusrclk),
.ch2_dfehold(iffcq32aptexthold),
.ch2_rxuserrdy(iffcq32rxusrrdy),
.ch2_txuserrdy(iffcq32txusrrdy),
.ch2_cdrfreqos(iffcq32cdrfreqos),
.ch2_cdrstepsq(iffcq32cdrstepsq),
.ch2_cdrstepsx(iffcq32cdrstepsx),
.ch2_dfeovrd(iffcq32aptoverwren),
.ch2_dmonitorclk(iffcq32dmonclk),
.ch2_dmonitorout(iffcq32dmonout),
.ch2_gtrxreset(iffcq32gtrxreset),
.ch2_gttxreset(iffcq32gttxreset),
.ch2_pcsrsvdin(iffcq32pcsrsvdin),
.ch2_phystatus(iffcq32phystatus),
.ch2_rxchbondi(iffcq32rxchbondi),
.ch2_rxchbondo(iffcq32rxchbondo),
.ch2_rxprbserr(iffcq32rxprbserr),
.ch2_rxprbssel(iffcq32rxprbssel),
.ch2_rxqpisenn(iffcq32rxqpisenn),
.ch2_rxqpisenp(iffcq32rxqpisenp),
.ch2_txcominit(iffcq32txcominit),
.ch2_txcomwake(iffcq32txcomwake),
.ch2_txdccdone(iffcq32txdccdone),
.ch2_txdiffctrl(iffcq32txdrvamp),
.ch2_txinhibit(iffcq32txinhibit),
.ch2_txpisopd(iffcq32txserpwrdn),
.ch2_txprbssel(iffcq32txprbssel),
.ch2_txqpisenn(iffcq32txqpisenn),
.ch2_txqpisenp(iffcq32txqpisenp),
.ch2_clkrsvd0(iffcq32ckpinrsrvd0),
.ch2_clkrsvd1(iffcq32ckpinrsrvd1),
.ch2_pinrsvdas(iffcq32pinrsrvdas),
.ch2_rxcdrovrden(iffcq32cdrovren),
.ch2_rxosintdone(iffcq32cfokdone),
.ch2_txprecursor(iffcq32txemppre),
.ch2_cdrstepdir(iffcq32cdrstepdir),
.ch2_pcsrsvdout(iffcq32pcsrsvdout),
.ch2_refdebugout(iffcq32refclkpma),
.ch2_rxcdrreset(iffcq32cdrphreset),
.ch2_rxcommadet(iffcq32rxcommadet),
.ch2_rxcomsasdet(iffcq32comsasdet),
.ch2_rxelecidle(iffcq32rxelecidle),
.ch2_rxoobreset(iffcq32rxoobreset),
.ch2_rxpolarity(iffcq32rxpolarity),
.ch2_rxsliderdy(iffcq32rxsliderdy),
.ch2_rxslipdone(iffcq32rxslipdone),
.ch2_rxsyncdone(iffcq32rxsyncdone),
.ch2_txelecidle(iffcq32txelecidle),
.ch2_txpolarity(iffcq32txpolarity),
.ch2_txpostcursor(iffcq32txemppos),
.ch2_txsequence(iffcq32txsequence),
.ch2_txsyncdone(iffcq32txsyncdone),
.ch2_cdrbmcdrreq(iffcq32cdrbmcdreq),
.ch2_rxclkcorcnt(iffcq32rxckcorcnt),
.ch2_txmaincursor(iffcq32txempmain),
.ch2_bufgtcemask(iffcq32bufgtcemask),
.ch2_cdrincpctrl(iffcq32cdrincpctrl),
.ch2_rxbufstatus(iffcq32rxbufstatus),
.ch2_rxcdrphdone(iffcq32rxcdrphdone),
.ch2_rxcominitdet(iffcq32cominitdet),
.ch2_rxcomwakedet(iffcq32comwakedet),
.ch2_rxdapireset(iffcq32rxdapireset),
.ch2_rxdatavalid(iffcq32rxdatavalid),
.ch2_rxresetdone(iffcq32rxresetdone),
.ch2_rxresetmode(iffcq32rxresetmode),
.ch2_rxsyncallin(iffcq32rxsyncallin),
.ch2_txbufstatus(iffcq32txbufstatus),
.ch2_txcomfinish(iffcq32txcomfinish),
.ch2_txdapireset(iffcq32txdapireset),
.ch2_txoneszeros(iffcq32txoneszeros),
.ch2_txqpibiasen(iffcq32txqpibiasen),
.ch2_txqpiweakpu(iffcq32txqpiweakpu),
.ch2_txresetdone(iffcq32txresetdone),
.ch2_txresetmode(iffcq32txresetmode),
.ch2_txsyncallin(iffcq32txsyncallin),
.ch2_rxphdlypd(iffcq32rxphasealignpd),
.ch2_txphdlypd(iffcq32txphasealignpd),
.ch2_bufgtrstmask(iffcq32bufgtrstmask),
.ch2_eyescanreset(iffcq32eyescanreset),
.ch2_hsdppcsreset(iffcq32hsdppcsreset),
.ch2_iloresetdone(iffcq32iloresetdone),
.ch2_iloresetmask(iffcq32iloresetmask),
.ch2_rxdebugpcsout(iffcq32rxoutpcsclk),
.ch2_rxeqtraining(iffcq32rxeqtraining),
.ch2_rxphdlyreset(iffcq32rxphdlyreset),
.ch2_rxprbslocked(iffcq32rxprbslocked),
.ch2_rxstartofseq(iffcq32rxstartofseq),
.ch2_txdebugpcsout(iffcq32txoutpcsclk),
.ch2_txphdlyreset(iffcq32txphdlyreset),
.ch2_rxmstreset(iffctrlq3mstrxreset[2]),
.ch2_txmstreset(iffctrlq3msttxreset[2]),
.ch2_dmonfiforeset(iffcq32dmonfiforeset),
.ch2_rx10gstat(iffcq32rxethernetstatout),
.ch2_rxbyterealign(q3_ch2_rxbyterealign),
.ch2_rxchanbondseq(iffcq32rxchanbondseq),
.ch2_rxchanrealign(iffcq32rxchanrealign),
.ch2_rxgearboxslip(iffcq32rxgearboxslip),
.ch2_rxheadervalid(iffcq32rxheadervalid),
.ch2_rxmldchainreq(iffcq32rxmldchainreq),
.ch2_rxtermination(iffcq32rxtermination),
.ch2_txmldchainreq(iffcq32txmldchainreq),
.ch2_txpippmstepsize(iffcq32stepsizeppm),
.ch2_txswingoutlow(iffcq32txswingoutlow),
.ch2_rxphalignerr(iffcq32rxphasealignerr),
.ch2_rxphalignreq(iffcq32rxphasealignreq),
.ch2_txphalignerr(iffcq32txphasealignerr),
.ch2_txphalignreq(iffcq32txphasealignreq),
.ch2_txphdlytstclk(iffcq32tcoclkfsmfrout),
.ch2_dmonitoroutclk(q3_ch2_dmonitoroutclk),
.ch2_eyescantrigger(iffcq32eyescantrigger),
.ch2_resetexception(iffcq32resetexception),
.ch2_rxchanisaligned(iffcq32rxchisaligned),
.ch2_rxdlyalignerr(iffcq32rxdelayalignerr),
.ch2_rxdlyalignreq(iffcq32rxdelayalignreq),
.ch2_rxmldchaindone(iffcq32rxmldchaindone),
.ch2_rxpcsresetmask(iffcq32rxpcsresetmask),
.ch2_rxpmaresetdone(iffcq32rxpmaresetdone),
.ch2_rxpmaresetmask(iffcq32rxpmaresetmask),
.ch2_rxprbscntreset(iffcq32rxprbscntreset),
.ch2_rxprogdivreset(iffcq32rxprogdivreset),
.ch2_txdetectrx(iffcq32txdetectrxloopback),
.ch2_txdlyalignerr(iffcq32txdelayalignerr),
.ch2_txdlyalignreq(iffcq32txdelayalignreq),
.ch2_txmldchaindone(iffcq32txmldchaindone),
.ch2_txpcsresetmask(iffcq32txpcsresetmask),
.ch2_txpicodereset(iffcq32txtxpicodereset),
.ch2_txpmaresetdone(iffcq32txpmaresetdone),
.ch2_txpmaresetmask(iffcq32txpmaresetmask),
.ch2_txprbsforceerr(iffcq32txprbsforceerr),
.ch2_txprogdivreset(iffcq32txprogdivreset),
.ch2_txswingouthigh(iffcq32txswingouthigh),
.ch2_rxphaligndone(iffcq32rxphasealigndone),
.ch2_txphaligndone(iffcq32txphasealigndone),
.ch2_rxbyteisaligned(iffcq32rxbyteisaligned),
.ch2_rxdapicodereset(iffcq32rxdapicodereset),
.ch2_rxdapiresetdone(iffcq32rxdapiresetdone),
.ch2_rxdapiresetmask(iffcq32rxdapiresetmask),
.ch2_rxfinealigndone(iffcq32rxfinealigndone),
.ch2_rxphshift180(iffcq32rxphaseshift180req),
.ch2_txdapicodereset(iffcq32txdapicodereset),
.ch2_txdapiresetdone(iffcq32txdapiresetdone),
.ch2_txdapiresetmask(iffcq32txdapiresetmask),
.ch2_txphalignoutrsvd(iffcq32txchicooutrsvd),
.ch2_txphshift180(iffcq32txphaseshift180req),
.ch2_txpicodeovrden(iffcq32txtxpicodeovrden),
.ch2_rxphsetinitreq(iffcq32rxphasesetinitreq),
.ch2_txphsetinitreq(iffcq32txphasesetinitreq),
.ch2_eyescandataerror(iffcq32eyescandataerror),
.ch2_rxdapicodeovrden(iffcq32rxdapicodeovrden),
.ch2_rxmlfinealignreq(iffcq32rxmlfinealignreq),
.ch2_txdapicodeovrden(iffcq32txdapicodeovrden),
.ch2_rxmstresetdone(iffctrlq3mstrxresetdone[2]),
.ch2_rxphsetinitdone(iffcq32rxphasesetinitdone),
.ch2_txmstresetdone(iffctrlq3msttxresetdone[2]),
.ch2_txphsetinitdone(iffcq32txphasesetinitdone),
.ch2_rxdlyalignprog(iffcq32rxdelayalignprogress),
.ch2_rxphalignresetmask(iffcq32rxchicoresetmask),
.ch2_txdlyalignprog(iffcq32txdelayalignprogress),
.ch2_txpausedelayalign(iffcq32txpausedelayalign),
.ch2_txphalignresetmask(iffcq32txchicoresetmask),
.ch2_xpipe5_pipeline_en(iffcq32xpipe5pipelineen),
.ch2_phyesmadaptsave(iffcq32phyesmadaptationsave),
.ch2_rxphshift180done(iffcq32rxphaseshift180done),
.ch2_tx10gstat(iffcq32txethernetstattxlocalfault),
.ch2_txphshift180done(iffcq32txphaseshift180done),
.ch2_rxprogdivresetdone(iffcq32rxprogdivresetdone),
.ch2_rxsimplexphystatus(iffcq32rxsimplexphystatus),
.ch2_txprogdivresetdone(iffcq32txprogdivresetdone),
.ch2_txsimplexphystatus(iffcq32txsimplexphystatus),
.ch2_rxphdlyresetdone(iffcq32rxphasedelayresetdone),
.ch2_txphdlyresetdone(iffcq32txphasedelayresetdone),

.ch3_rxdata(iffcq33rxdata),
.ch3_rxrate(iffcq33rxrate),
.ch3_txdata(iffcq33txdata),
.ch3_txrate(iffcq33txrate),
.ch3_bufgtce(iffcq33bufgtce),
.ch3_gtrsvd(iffcq33pinrsrvd),
.ch3_pcierstb(iffcq33perstb),
.ch3_rxctrl0(iffcq33rxctrl0),
.ch3_rxctrl1(iffcq33rxctrl1),
.ch3_rxctrl2(iffcq33rxctrl2),
.ch3_rxctrl3(iffcq33rxctrl3),
.ch3_rxlpmen(iffcq33rxlpmen),
.ch3_rxpkdet(q3_ch3_rxpkdet),
.ch3_rxqpien(iffcq33rxqpien),
.ch3_rxslide(iffcq33rxslide),
.ch3_rxvalid(iffcq33rxvalid),
.ch3_tstclk0(iffcq33tstclk0),
.ch3_tstclk1(iffcq33tstclk1),
.ch3_txctrl0(iffcq33txctrl0),
.ch3_txctrl1(iffcq33txctrl1),
.ch3_txctrl2(iffcq33txctrl2),
.ch3_txpippmen(iffcq33enppm),
.ch3_txswing(iffcq33txswing),
.ch3_rxpd(iffcq33rxpowerdown),
.ch3_txpd(iffcq33txpowerdown),
.ch3_bufgtdiv(iffcq33bufgtdiv),
.ch3_bufgtrst(iffcq33bufgtrst),
.ch3_iloreset(iffcq33iloreset),
.ch3_loopback(iffcq33loopback),
.ch3_phyready(iffcq33phyready),
.ch3_rxcdrhold(iffcq33cdrhold),
.ch3_rxcdrlock(iffcq33cdrlock),
.ch3_rxheader(iffcq33rxheader),
.ch3_rxlatclk(iffcq33rxlatclk),
.ch3_rxoutclk(q3_ch3_rxoutclk),
.ch3_rxstatus(iffcq33rxstatus),
.ch3_rxusrclk(iffcq33rxusrclk),
.ch3_txcomsas(iffcq33txcomsas),
.ch3_txdeemph(iffcq33txdeemph),
.ch3_txheader(iffcq33txheader),
.ch3_txlatclk(iffcq33txlatclk),
.ch3_txmargin(iffcq33txmargin),
.ch3_txoutclk(q3_ch3_txoutclk),
.ch3_txusrclk(iffcq33txusrclk),
.ch3_dfehold(iffcq33aptexthold),
.ch3_rxuserrdy(iffcq33rxusrrdy),
.ch3_txuserrdy(iffcq33txusrrdy),
.ch3_cdrfreqos(iffcq33cdrfreqos),
.ch3_cdrstepsq(iffcq33cdrstepsq),
.ch3_cdrstepsx(iffcq33cdrstepsx),
.ch3_dfeovrd(iffcq33aptoverwren),
.ch3_dmonitorclk(iffcq33dmonclk),
.ch3_dmonitorout(iffcq33dmonout),
.ch3_gtrxreset(iffcq33gtrxreset),
.ch3_gttxreset(iffcq33gttxreset),
.ch3_pcsrsvdin(iffcq33pcsrsvdin),
.ch3_phystatus(iffcq33phystatus),
.ch3_rxchbondi(iffcq33rxchbondi),
.ch3_rxchbondo(iffcq33rxchbondo),
.ch3_rxprbserr(iffcq33rxprbserr),
.ch3_rxprbssel(iffcq33rxprbssel),
.ch3_rxqpisenn(iffcq33rxqpisenn),
.ch3_rxqpisenp(iffcq33rxqpisenp),
.ch3_txcominit(iffcq33txcominit),
.ch3_txcomwake(iffcq33txcomwake),
.ch3_txdccdone(iffcq33txdccdone),
.ch3_txdiffctrl(iffcq33txdrvamp),
.ch3_txinhibit(iffcq33txinhibit),
.ch3_txpisopd(iffcq33txserpwrdn),
.ch3_txprbssel(iffcq33txprbssel),
.ch3_txqpisenn(iffcq33txqpisenn),
.ch3_txqpisenp(iffcq33txqpisenp),
.ch3_clkrsvd0(iffcq33ckpinrsrvd0),
.ch3_clkrsvd1(iffcq33ckpinrsrvd1),
.ch3_pinrsvdas(iffcq33pinrsrvdas),
.ch3_rxcdrovrden(iffcq33cdrovren),
.ch3_rxosintdone(iffcq33cfokdone),
.ch3_txprecursor(iffcq33txemppre),
.ch3_cdrstepdir(iffcq33cdrstepdir),
.ch3_pcsrsvdout(iffcq33pcsrsvdout),
.ch3_refdebugout(iffcq33refclkpma),
.ch3_rxcdrreset(iffcq33cdrphreset),
.ch3_rxcommadet(iffcq33rxcommadet),
.ch3_rxcomsasdet(iffcq33comsasdet),
.ch3_rxelecidle(iffcq33rxelecidle),
.ch3_rxoobreset(iffcq33rxoobreset),
.ch3_rxpolarity(iffcq33rxpolarity),
.ch3_rxsliderdy(iffcq33rxsliderdy),
.ch3_rxslipdone(iffcq33rxslipdone),
.ch3_rxsyncdone(iffcq33rxsyncdone),
.ch3_txelecidle(iffcq33txelecidle),
.ch3_txpolarity(iffcq33txpolarity),
.ch3_txpostcursor(iffcq33txemppos),
.ch3_txsequence(iffcq33txsequence),
.ch3_txsyncdone(iffcq33txsyncdone),
.ch3_cdrbmcdrreq(iffcq33cdrbmcdreq),
.ch3_rxclkcorcnt(iffcq33rxckcorcnt),
.ch3_txmaincursor(iffcq33txempmain),
.ch3_bufgtcemask(iffcq33bufgtcemask),
.ch3_cdrincpctrl(iffcq33cdrincpctrl),
.ch3_rxbufstatus(iffcq33rxbufstatus),
.ch3_rxcdrphdone(iffcq33rxcdrphdone),
.ch3_rxcominitdet(iffcq33cominitdet),
.ch3_rxcomwakedet(iffcq33comwakedet),
.ch3_rxdapireset(iffcq33rxdapireset),
.ch3_rxdatavalid(iffcq33rxdatavalid),
.ch3_rxresetdone(iffcq33rxresetdone),
.ch3_rxresetmode(iffcq33rxresetmode),
.ch3_rxsyncallin(iffcq33rxsyncallin),
.ch3_txbufstatus(iffcq33txbufstatus),
.ch3_txcomfinish(iffcq33txcomfinish),
.ch3_txdapireset(iffcq33txdapireset),
.ch3_txoneszeros(iffcq33txoneszeros),
.ch3_txqpibiasen(iffcq33txqpibiasen),
.ch3_txqpiweakpu(iffcq33txqpiweakpu),
.ch3_txresetdone(iffcq33txresetdone),
.ch3_txresetmode(iffcq33txresetmode),
.ch3_txsyncallin(iffcq33txsyncallin),
.ch3_rxphdlypd(iffcq33rxphasealignpd),
.ch3_txphdlypd(iffcq33txphasealignpd),
.ch3_bufgtrstmask(iffcq33bufgtrstmask),
.ch3_eyescanreset(iffcq33eyescanreset),
.ch3_hsdppcsreset(iffcq33hsdppcsreset),
.ch3_iloresetdone(iffcq33iloresetdone),
.ch3_iloresetmask(iffcq33iloresetmask),
.ch3_rxdebugpcsout(iffcq33rxoutpcsclk),
.ch3_rxeqtraining(iffcq33rxeqtraining),
.ch3_rxphdlyreset(iffcq33rxphdlyreset),
.ch3_rxprbslocked(iffcq33rxprbslocked),
.ch3_rxstartofseq(iffcq33rxstartofseq),
.ch3_txdebugpcsout(iffcq33txoutpcsclk),
.ch3_txphdlyreset(iffcq33txphdlyreset),
.ch3_rxmstreset(iffctrlq3mstrxreset[3]),
.ch3_txmstreset(iffctrlq3msttxreset[3]),
.ch3_dmonfiforeset(iffcq33dmonfiforeset),
.ch3_rx10gstat(iffcq33rxethernetstatout),
.ch3_rxbyterealign(q3_ch3_rxbyterealign),
.ch3_rxchanbondseq(iffcq33rxchanbondseq),
.ch3_rxchanrealign(iffcq33rxchanrealign),
.ch3_rxgearboxslip(iffcq33rxgearboxslip),
.ch3_rxheadervalid(iffcq33rxheadervalid),
.ch3_rxmldchainreq(iffcq33rxmldchainreq),
.ch3_rxtermination(iffcq33rxtermination),
.ch3_txmldchainreq(iffcq33txmldchainreq),
.ch3_txpippmstepsize(iffcq33stepsizeppm),
.ch3_txswingoutlow(iffcq33txswingoutlow),
.ch3_rxphalignerr(iffcq33rxphasealignerr),
.ch3_rxphalignreq(iffcq33rxphasealignreq),
.ch3_txphalignerr(iffcq33txphasealignerr),
.ch3_txphalignreq(iffcq33txphasealignreq),
.ch3_txphdlytstclk(iffcq33tcoclkfsmfrout),
.ch3_dmonitoroutclk(q3_ch3_dmonitoroutclk),
.ch3_eyescantrigger(iffcq33eyescantrigger),
.ch3_resetexception(iffcq33resetexception),
.ch3_rxchanisaligned(iffcq33rxchisaligned),
.ch3_rxdlyalignerr(iffcq33rxdelayalignerr),
.ch3_rxdlyalignreq(iffcq33rxdelayalignreq),
.ch3_rxmldchaindone(iffcq33rxmldchaindone),
.ch3_rxpcsresetmask(iffcq33rxpcsresetmask),
.ch3_rxpmaresetdone(iffcq33rxpmaresetdone),
.ch3_rxpmaresetmask(iffcq33rxpmaresetmask),
.ch3_rxprbscntreset(iffcq33rxprbscntreset),
.ch3_rxprogdivreset(iffcq33rxprogdivreset),
.ch3_txdetectrx(iffcq33txdetectrxloopback),
.ch3_txdlyalignerr(iffcq33txdelayalignerr),
.ch3_txdlyalignreq(iffcq33txdelayalignreq),
.ch3_txmldchaindone(iffcq33txmldchaindone),
.ch3_txpcsresetmask(iffcq33txpcsresetmask),
.ch3_txpicodereset(iffcq33txtxpicodereset),
.ch3_txpmaresetdone(iffcq33txpmaresetdone),
.ch3_txpmaresetmask(iffcq33txpmaresetmask),
.ch3_txprbsforceerr(iffcq33txprbsforceerr),
.ch3_txprogdivreset(iffcq33txprogdivreset),
.ch3_txswingouthigh(iffcq33txswingouthigh),
.ch3_rxphaligndone(iffcq33rxphasealigndone),
.ch3_txphaligndone(iffcq33txphasealigndone),
.ch3_rxbyteisaligned(iffcq33rxbyteisaligned),
.ch3_rxdapicodereset(iffcq33rxdapicodereset),
.ch3_rxdapiresetdone(iffcq33rxdapiresetdone),
.ch3_rxdapiresetmask(iffcq33rxdapiresetmask),
.ch3_rxfinealigndone(iffcq33rxfinealigndone),
.ch3_rxphshift180(iffcq33rxphaseshift180req),
.ch3_txdapicodereset(iffcq33txdapicodereset),
.ch3_txdapiresetdone(iffcq33txdapiresetdone),
.ch3_txdapiresetmask(iffcq33txdapiresetmask),
.ch3_txphalignoutrsvd(iffcq33txchicooutrsvd),
.ch3_txphshift180(iffcq33txphaseshift180req),
.ch3_txpicodeovrden(iffcq33txtxpicodeovrden),
.ch3_rxphsetinitreq(iffcq33rxphasesetinitreq),
.ch3_txphsetinitreq(iffcq33txphasesetinitreq),
.ch3_eyescandataerror(iffcq33eyescandataerror),
.ch3_rxdapicodeovrden(iffcq33rxdapicodeovrden),
.ch3_rxmlfinealignreq(iffcq33rxmlfinealignreq),
.ch3_txdapicodeovrden(iffcq33txdapicodeovrden),
.ch3_rxmstresetdone(iffctrlq3mstrxresetdone[3]),
.ch3_rxphsetinitdone(iffcq33rxphasesetinitdone),
.ch3_txmstresetdone(iffctrlq3msttxresetdone[3]),
.ch3_txphsetinitdone(iffcq33txphasesetinitdone),
.ch3_rxdlyalignprog(iffcq33rxdelayalignprogress),
.ch3_rxphalignresetmask(iffcq33rxchicoresetmask),
.ch3_txdlyalignprog(iffcq33txdelayalignprogress),
.ch3_txpausedelayalign(iffcq33txpausedelayalign),
.ch3_txphalignresetmask(iffcq33txchicoresetmask),
.ch3_xpipe5_pipeline_en(iffcq33xpipe5pipelineen),
.ch3_phyesmadaptsave(iffcq33phyesmadaptationsave),
.ch3_rxphshift180done(iffcq33rxphaseshift180done),
.ch3_tx10gstat(iffcq33txethernetstattxlocalfault),
.ch3_txphshift180done(iffcq33txphaseshift180done),
.ch3_rxprogdivresetdone(iffcq33rxprogdivresetdone),
.ch3_rxsimplexphystatus(iffcq33rxsimplexphystatus),
.ch3_txprogdivresetdone(iffcq33txprogdivresetdone),
.ch3_txsimplexphystatus(iffcq33txsimplexphystatus),
.ch3_rxphdlyresetdone(iffcq33rxphasedelayresetdone),
.ch3_txphdlyresetdone(iffcq33txphasedelayresetdone),

.ctrlrsvdin(iffctrlq3gtrsvdin),
.ctrlrsvdout(iffctrlq3gtrsvdout),
.coestatusdebug(iffctrlq3coeregrst),
.correcterr(iffctrlq3correctableerr),

.debugtraceclk(iffctrlq3debugtraceclk),
.debugtracetdata(iffctrlq3debugtracetdata),
.debugtraceready(iffctrlq3debugtracetready),
.debugtracetvalid(iffctrlq3debugtracetvalid),

.gpi(iffctrlq3ubgpi),
.gpo(iffctrlq3ubgpo),
.gtpowergood(iffctrlq3gtpowergood),

.hsclk0_rpllpd(iffhsq30rpllpwrdn),
.hsclk0_lcpllpd(iffhsq30lcpllpwrdn),
.hsclk0_rpllfbdiv(iffhsq30rpllfbdiv),
.hsclk0_rpllreset(iffhsq30rpllreset),
.hsclk0_lcpllfbdiv(iffhsq30lcpllfbdiv),
.hsclk0_lcpllreset(iffhsq30lcpllreset),
.hsclk0_rplllock(iffhsq30rpllfreqlock),
.hsclk0_lcplllock(iffhsq30lcpllfreqlock),
.hsclk0_rpllsdmdata(iffhsq30rpllsdmdata),
.hsclk0_rpllfbclklost(iffhsq30rpllfbloss),
.hsclk0_lcpllsdmdata(iffhsq30lcpllsdmdata),
.hsclk0_rxrecclkout0(iffhsq30rxrecclkout0),
.hsclk0_rxrecclkout1(iffhsq30rxrecclkout1),
.hsclk0_lcpllfbclklost(iffhsq30lcpllfbloss),
.hsclk0_rpllrefclklost(iffhsq30rpllrefloss),
.hsclk0_rpllrefclksel(iffhsq30rpllrefseldyn),
.hsclk0_rpllresetmask(iffhsq30rpllresetmask),
.hsclk0_rpllsdmtoggle(iffhsq30rpllsdmtoggle),
.hsclk0_lcpllrefclklost(iffhsq30lcpllrefloss),
.hsclk0_lcpllrefclksel(iffhsq30lcpllrefseldyn),
.hsclk0_lcpllresetmask(iffhsq30lcpllresetmask),
.hsclk0_lcpllsdmtoggle(iffhsq30lcpllsdmtoggle),
.hsclk0_rpllrefclkmonitor(iffhsq30mgtrpllrefclkfa),
.hsclk0_lcpllrefclkmonitor(iffhsq30mgtlcpllrefclkfa),
.hsclk0_rpllresetbypassmode(iffhsq30rpllresetbypassmode),
.hsclk0_lcpllresetbypassmode(iffhsq30lcpllresetbypassmode),

.hsclk1_rpllpd(iffhsq31rpllpwrdn),
.hsclk1_lcpllpd(iffhsq31lcpllpwrdn),
.hsclk1_rpllfbdiv(iffhsq31rpllfbdiv),
.hsclk1_rpllreset(iffhsq31rpllreset),
.hsclk1_lcpllfbdiv(iffhsq31lcpllfbdiv),
.hsclk1_lcpllreset(iffhsq31lcpllreset),
.hsclk1_rplllock(iffhsq31rpllfreqlock),
.hsclk1_lcplllock(iffhsq31lcpllfreqlock),
.hsclk1_rpllsdmdata(iffhsq31rpllsdmdata),
.hsclk1_rpllfbclklost(iffhsq31rpllfbloss),
.hsclk1_lcpllsdmdata(iffhsq31lcpllsdmdata),
.hsclk1_rxrecclkout0(iffhsq31rxrecclkout0),
.hsclk1_rxrecclkout1(iffhsq31rxrecclkout1),
.hsclk1_lcpllfbclklost(iffhsq31lcpllfbloss),
.hsclk1_rpllrefclklost(iffhsq31rpllrefloss),
.hsclk1_rpllrefclksel(iffhsq31rpllrefseldyn),
.hsclk1_rpllresetmask(iffhsq31rpllresetmask),
.hsclk1_rpllsdmtoggle(iffhsq31rpllsdmtoggle),
.hsclk1_lcpllrefclklost(iffhsq31lcpllrefloss),
.hsclk1_lcpllrefclksel(iffhsq31lcpllrefseldyn),
.hsclk1_lcpllresetmask(iffhsq31lcpllresetmask),
.hsclk1_lcpllsdmtoggle(iffhsq31lcpllsdmtoggle),
.hsclk1_rpllrefclkmonitor(iffhsq31mgtrpllrefclkfa),
.hsclk1_lcpllrefclkmonitor(iffhsq31mgtlcpllrefclkfa),
.hsclk1_rpllresetbypassmode(iffhsq31rpllresetbypassmode),
.hsclk1_lcpllresetbypassmode(iffhsq31lcpllresetbypassmode),

.m0_axis_tdata(iffctrlq3m0axistdata),
.m0_axis_tlast(iffctrlq3m0axistlast),
.m1_axis_tdata(iffctrlq3m1axistdata),
.m1_axis_tlast(iffctrlq3m1axistlast),
.m2_axis_tdata(iffctrlq3m2axistdata),
.m2_axis_tlast(iffctrlq3m2axistlast),
.s0_axis_tdata(iffctrlq3s0axistdata),
.s0_axis_tlast(iffctrlq3s0axistlast),
.s1_axis_tdata(iffctrlq3s1axistdata),
.s1_axis_tlast(iffctrlq3s1axistlast),
.s2_axis_tdata(iffctrlq3s2axistdata),
.s2_axis_tlast(iffctrlq3s2axistlast),
.m0_axis_tready(iffctrlq3m0axistready),
.m0_axis_tvalid(iffctrlq3m0axistvalid),
.m1_axis_tready(iffctrlq3m1axistready),
.m1_axis_tvalid(iffctrlq3m1axistvalid),
.m2_axis_tready(iffctrlq3m2axistready),
.m2_axis_tvalid(iffctrlq3m2axistvalid),
.s0_axis_tready(iffctrlq3s0axistready),
.s0_axis_tvalid(iffctrlq3s0axistvalid),
.s1_axis_tready(iffctrlq3s1axistready),
.s1_axis_tvalid(iffctrlq3s1axistvalid),
.s2_axis_tready(iffctrlq3s2axistready),
.s2_axis_tvalid(iffctrlq3s2axistvalid),

.rcalenb(iffctrlq3rcalenb),
.pcieltssm(iffctrlq3pcieltssmstate),
.uncorrecterr(iffctrlq3uncorrectableerr),
.pcielinkreachtarget(iffctrlq3pcielinkreachtarget),

.refclk0_clktestsigint(),
.refclk1_clktestsigint(),
.refclk0_gtrefclkpd(iffrckq30refclkpd),
.refclk1_gtrefclkpd(iffrckq31refclkpd),
.refclk0_clktestsig(iffrckq30hrowtestck),
.refclk1_clktestsig(iffrckq31hrowtestck),
.refclk0_gtrefclkpdint(gt3_refclk0_pdint),
.refclk1_gtrefclkpdint(gt3_refclk1_pdint),

.rxmarginclk(iffctrlq3rxmarginclk),
.rxmarginreqack(iffctrlq3rxmarginreqack),
.rxmarginreqcmd(iffctrlq3rxmarginreqcmd),
.rxmarginreqreq(iffctrlq3rxmarginreqreq),
.rxmarginresack(iffctrlq3rxmarginresack),
.rxmarginrescmd(iffctrlq3rxmarginrescmd),
.rxmarginresreq(iffctrlq3rxmarginresreq),
.rxmarginrespayld(iffctrlq3rxmarginrespayld),
.rxmarginreqpayld(iffctrlq3rxmarginreqpayload),
.rxmarginreqlanenum(iffctrlq3rxmarginreqlanenum),
.rxmarginreslanenum(iffctrlq3rxmarginreslanenum),

.trigin0(iffctrlq3trigin0),
.trigout0(iffctrlq3trigout0),
.trigackin0(iffctrlq3trigackin0),
.trigackout0(iffctrlq3trigackout0),

.ubintr(iffctrlq3ubintr),
.ubmbrst(iffctrlq3ubmbrst),
.ubenable(iffctrlq3ubenable),
.ubrxuart(iffctrlq3ubrxuart),
.ubtxuart(iffctrlq3ubtxuart),
.ubiolmbrst(iffctrlq3ubiolmbrst),
.ubinterrupt(iffctrlq3ubinterrupt),

.pipenorthout(),
.rxpinorthout(),
.txpinorthout(),
.pipesouthin('d0),
.rxpisouthin('d0),
.txpisouthin('d0),
.resetdone_northout(),
.resetdone_southin('d0),
.pipenorthin(pipenorthoutq2_to_pipenorthinq3),
.rxpinorthin(rxpinorthout_q2_to_rxpinorthin_q3),
.rxpisouthout(rxpisouthin_q2_to_rxpsouthout_q3),
.txpinorthin(txpinorthout_q2_to_txpinorthin_q3),
.txpisouthout(txpisouthin_q2_to_txpsouthout_q3),
.pipesouthout(pipesouthin_q2_to_pipesouthout_q3),
.resetdone_northin(resetdone_northout_q2_to_resetdone_northin_q3),
.resetdone_southout(resetdone_southin_q2_to_resetdone_southout_q3),

.rxn(gt3_serial_rxn),
.rxp(gt3_serial_rxp),
.txn(gt3_serial_txn),
.txp(gt3_serial_txp)
