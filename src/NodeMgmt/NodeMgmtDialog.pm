# Form implementation generated from reading ui file 'NodeMgmtDialog.ui'
#
# Created: Thu Dec 23 15:36:09 2004
#      by: The PerlQt User Interface Compiler (puic)
#
# WARNING! All changes made in this file will be lost!


use strict;
use utf8;


package NodeMgmtDialog;
use Qt;
use NodeMgmtTable;
use Qt::isa qw(Qt::MainWindow);
use Qt::slots
    init => [],
    populate_nodetable => [],
    advancedButton_toggled => ['bool'],
    nodesettingschange_clicked => [],
    refreshsamplenode => [],
    defineNnodes => [],
    startnetcollection => [],
    stopnetcollection => [],
    processnetmacs => [],
    getcollectedmacs => [],
    importfilebrowse_clicked => [],
    importmacs_clicked => [],
    exportmacs_clicked => [],
    importmanualmac_clicked => [],
    straytounass_clicked => [],
    allstraytounass_clicked => [],
    unasstostray_clicked => [],
    allunasstostray_clicked => [],
    clearmacs_clicked => [],
    closeDialog_clicked => [],
    definenode => [],
    getnextnodeip => [],
    getnextnodename => [],
    assignmac_clicked => [],
    assignallmacs_clicked => [],
    unassignmac_clicked => [],
    othermacs_dimmer => [],
    straymacs_dimmer => [],
    closeEvent => [],
    backButton_clicked => [],
    nextButton_clicked => [],
    setButtonShown => ['char*', 'char*', 'bool'],
    reReadOda => ['char*'];
use Qt::signals
    backButtonWasClicked => ['char*'],
    nextButtonWasClicked => ['char*'],
    taskToolClosing => ['char*'];
use Qt::attributes qw(
    advancedBox
    exportmacs
    exportmacs_font
    multicast
    multicast_font
    macfiltering
    macfiltering_font
    nodesettingschange
    nodesettingschange_font
    nodeTable
    nodeTable_font
    nodelook
    nodelook_font
    assignmac
    assignmac_font
    assignallmacs
    assignallmacs_font
    unassignmac
    unassignmac_font
    textLabel8
    textLabel8_font
    othermacs
    othermacs_font
    clearmacs
    clearmacs_font
    collectionmethodselect
    manualcollect
    filecollect
    networkcollect
    collectionmethod
    network
    straytounass
    allstraytounass
    unasstostray
    allunasstostray
    textLabel3_3
    textLabel3_3_font
    straymacs
    straymacs_font
    startcollect
    stopcollect
    file
    importmacfile
    importfilebrowse
    importmacs
    importmacs_font
    manual
    textLabel1
    textLabel1_font
    manualmac
    importmanualmac
    autoassignGroup
    autodefine
    autodefine_font
    assignblanksfirst
    assignblanksfirst_font
    deletenode
    deletenode_font
    definenodesButton
    definenodesButton_font
    definenodesnum
    definenodesnum_font
    textLabel2_2
    textLabel2_2_font
    advancedButton
    advancedButton_font
    backButton
    backButton_font
    closeDialog
    closeDialog_font
    nextButton
    nextButton_font
);

use NodeSettingsDialog;;
use Qt::attributes qw(settingsDialog macprocessTimer mac_collectorProcess);;
use lib "$ENV{OSCAR_HOME}/lib";;
use OSCAR::MACops;;
my @macs;;
my $nodes;;
my %usedmacs;;
use lib "../Installer"; use InstallerImages;;

sub uic_load_pixmap_NodeMgmtDialog
{
    my $pix = Qt::Pixmap();
    my $m = Qt::MimeSourceFactory::defaultFactory()->data(shift);

    if($m)
    {
        Qt::ImageDrag::decode($m, $pix);
    }

    return $pix;
}


sub NEW
{
    shift->SUPER::NEW(@_[0..2]);
    statusBar();

    if( name() eq "unnamed" )
    {
        setName("NodeMgmtDialog");
    }
    resize(631,704);
    setMinimumSize(Qt::Size(576, 562));
    setMaximumSize(Qt::Size(32767, 32767));
    setBaseSize(Qt::Size(650, 350));
    setCaption(trUtf8("Manage Nodes","Use this window to manage node information"));

    setCentralWidget(Qt::Widget(this, "qt_central_widget"));
    my $NodeMgmtDialogLayout = Qt::GridLayout(centralWidget(), 1, 1, 2, 1, '$NodeMgmtDialogLayout');

    advancedBox = Qt::GroupBox(centralWidget(), "advancedBox");
    advancedBox->setEnabled(1);
    advancedBox->setSizePolicy(Qt::SizePolicy(1, 1, 0, 0, advancedBox->sizePolicy()->hasHeightForWidth()));
    advancedBox->setMinimumSize(Qt::Size(190, 120));
    advancedBox->setMaximumSize(Qt::Size(225, 150));
    advancedBox->setTitle(trUtf8("Advanced"));
    advancedBox->setColumnLayout( 0, &Vertical );
    advancedBox->layout()->setSpacing(0);
    advancedBox->layout()->setMargin(11);
    my $advancedBoxLayout = Qt::GridLayout(advancedBox->layout() );
    $advancedBoxLayout->setAlignment( &AlignTop );

    exportmacs = Qt::PushButton(advancedBox, "exportmacs");
    exportmacs->setSizePolicy(Qt::SizePolicy(1, 0, 0, 0, exportmacs->sizePolicy()->hasHeightForWidth()));
    exportmacs->setMinimumSize(Qt::Size(150, 30));
    exportmacs->setMaximumSize(Qt::Size(175, 45));
    exportmacs_font = Qt::Font(exportmacs->font);
    exportmacs->setFont(exportmacs_font);
    exportmacs->setText(trUtf8("&Export MAC Addresses..."));

    $advancedBoxLayout->addWidget(exportmacs, 0, 0);

    multicast = Qt::CheckBox(advancedBox, "multicast");
    multicast->setSizePolicy(Qt::SizePolicy(1, 0, 0, 0, multicast->sizePolicy()->hasHeightForWidth()));
    multicast->setMinimumSize(Qt::Size(150, 30));
    multicast->setMaximumSize(Qt::Size(175, 45));
    multicast_font = Qt::Font(multicast->font);
    multicast_font->setFamily("Helvetica");
    multicast->setFont(multicast_font);
    multicast->setText(trUtf8("Enable Multicast Support"));

    $advancedBoxLayout->addWidget(multicast, 1, 0);

    macfiltering = Qt::PushButton(advancedBox, "macfiltering");
    macfiltering->setEnabled(0);
    macfiltering->setSizePolicy(Qt::SizePolicy(1, 1, 0, 0, macfiltering->sizePolicy()->hasHeightForWidth()));
    macfiltering->setMinimumSize(Qt::Size(150, 30));
    macfiltering->setMaximumSize(Qt::Size(175, 45));
    macfiltering_font = Qt::Font(macfiltering->font);
    macfiltering_font->setFamily("Helvetica");
    macfiltering->setFont(macfiltering_font);
    macfiltering->setText(trUtf8("Filter MAC Addresses..."));

    $advancedBoxLayout->addWidget(macfiltering, 2, 0);

    $NodeMgmtDialogLayout->addWidget(advancedBox, 1, 0);

    my $layout56 = Qt::VBoxLayout(undef, 11, 6, '$layout56');

    my $layout55 = Qt::HBoxLayout(undef, 11, 6, '$layout55');

    my $layout20 = Qt::VBoxLayout(undef, 1, 1, '$layout20');

    nodesettingschange = Qt::PushButton(centralWidget(), "nodesettingschange");
    nodesettingschange->setSizePolicy(Qt::SizePolicy(7, 1, 0, 0, nodesettingschange->sizePolicy()->hasHeightForWidth()));
    nodesettingschange->setMinimumSize(Qt::Size(175, 30));
    nodesettingschange->setMaximumSize(Qt::Size(600, 1500));
    nodesettingschange_font = Qt::Font(nodesettingschange->font);
    nodesettingschange->setFont(nodesettingschange_font);
    nodesettingschange->setFocusPolicy(&Qt::PushButton::StrongFocus);
    nodesettingschange->setText(trUtf8("Change New Node Settings..."));
    $layout20->addWidget(nodesettingschange);

    nodeTable = NodeMgmtTable(centralWidget(), "nodeTable");
    nodeTable->setSizePolicy(Qt::SizePolicy(1, 3, 4, 2, nodeTable->sizePolicy()->hasHeightForWidth()));
    nodeTable->setMinimumSize(Qt::Size(200, 200));
    nodeTable->setMaximumSize(Qt::Size(600, 4000));
    nodeTable_font = Qt::Font(nodeTable->font);
    nodeTable->setFont(nodeTable_font);
    nodeTable->setAcceptDrops(1);
    $layout20->addWidget(nodeTable);

    nodelook = Qt::Label(centralWidget(), "nodelook");
    nodelook->setSizePolicy(Qt::SizePolicy(1, 1, 0, 0, nodelook->sizePolicy()->hasHeightForWidth()));
    nodelook->setMinimumSize(Qt::Size(70, 10));
    nodelook->setMaximumSize(Qt::Size(600, 100));
    nodelook_font = Qt::Font(nodelook->font);
    nodelook->setFont(nodelook_font);
    nodelook->setText(trUtf8("Next node will be __________"));
    nodelook->setAlignment(int(&Qt::Label::WordBreak | &Qt::Label::AlignVCenter));
    $layout20->addWidget(nodelook);
    $layout55->addLayout($layout20);

    my $layout54 = Qt::VBoxLayout(undef, 11, 6, '$layout54');

    my $layout53 = Qt::HBoxLayout(undef, 0, 2, '$layout53');

    my $layout52 = Qt::VBoxLayout(undef, 0, 1, '$layout52');

    my $layout36 = Qt::VBoxLayout(undef, 0, 0, '$layout36');
    my $spacer = Qt::SpacerItem(16, 30, &Qt::SizePolicy::Minimum, &Qt::SizePolicy::Preferred);
    $layout36->addItem($spacer);

    my $layout35 = Qt::HBoxLayout(undef, 0, 0, '$layout35');

    my $layout18 = Qt::VBoxLayout(undef, 0, 1, '$layout18');

    assignmac = Qt::PushButton(centralWidget(), "assignmac");
    assignmac->setSizePolicy(Qt::SizePolicy(1, 1, 0, 0, assignmac->sizePolicy()->hasHeightForWidth()));
    assignmac->setMinimumSize(Qt::Size(30, 30));
    assignmac->setMaximumSize(Qt::Size(30, 32767));
    assignmac_font = Qt::Font(assignmac->font);
    assignmac_font->setFamily("Helvetica");
    assignmac->setFont(assignmac_font);
    assignmac->setText(trUtf8("<"));
    Qt::ToolTip::add(assignmac, trUtf8("Assign MAC to Node"));
    $layout18->addWidget(assignmac);

    assignallmacs = Qt::PushButton(centralWidget(), "assignallmacs");
    assignallmacs->setSizePolicy(Qt::SizePolicy(1, 1, 0, 0, assignallmacs->sizePolicy()->hasHeightForWidth()));
    assignallmacs->setMinimumSize(Qt::Size(30, 30));
    assignallmacs->setMaximumSize(Qt::Size(30, 32767));
    assignallmacs_font = Qt::Font(assignallmacs->font);
    assignallmacs_font->setFamily("Helvetica");
    assignallmacs->setFont(assignallmacs_font);
    assignallmacs->setText(trUtf8("<<"));
    Qt::ToolTip::add(assignallmacs, trUtf8("Assign All MACs"));
    $layout18->addWidget(assignallmacs);

    unassignmac = Qt::PushButton(centralWidget(), "unassignmac");
    unassignmac->setSizePolicy(Qt::SizePolicy(1, 1, 0, 0, unassignmac->sizePolicy()->hasHeightForWidth()));
    unassignmac->setMinimumSize(Qt::Size(30, 30));
    unassignmac->setMaximumSize(Qt::Size(30, 32767));
    unassignmac_font = Qt::Font(unassignmac->font);
    unassignmac_font->setFamily("Helvetica");
    unassignmac->setFont(unassignmac_font);
    unassignmac->setText(trUtf8(">"));
    Qt::ToolTip::add(unassignmac, trUtf8("Unassign MAC from Node"));
    $layout18->addWidget(unassignmac);
    $layout35->addLayout($layout18);

    my $layout34 = Qt::VBoxLayout(undef, 0, 0, '$layout34');

    textLabel8 = Qt::Label(centralWidget(), "textLabel8");
    textLabel8->setSizePolicy(Qt::SizePolicy(3, 1, 2, 1, textLabel8->sizePolicy()->hasHeightForWidth()));
    textLabel8->setMinimumSize(Qt::Size(60, 30));
    textLabel8->setMaximumSize(Qt::Size(130, 32767));
    textLabel8_font = Qt::Font(textLabel8->font);
    textLabel8->setFont(textLabel8_font);
    textLabel8->setText(trUtf8("Unassigned MAC Addresses"));
    textLabel8->setAlignment(int(&Qt::Label::WordBreak | &Qt::Label::AlignCenter));
    $layout34->addWidget(textLabel8);

    othermacs = Qt::ListBox(centralWidget(), "othermacs");
    othermacs->setSizePolicy(Qt::SizePolicy(3, 7, 2, 3, othermacs->sizePolicy()->hasHeightForWidth()));
    othermacs->setMinimumSize(Qt::Size(110, 0));
    othermacs->setMaximumSize(Qt::Size(120, 32767));
    othermacs_font = Qt::Font(othermacs->font);
    othermacs_font->setFamily("Helvetica");
    othermacs->setFont(othermacs_font);
    $layout34->addWidget(othermacs);
    $layout35->addLayout($layout34);
    $layout36->addLayout($layout35);
    $layout52->addLayout($layout36);

    clearmacs = Qt::PushButton(centralWidget(), "clearmacs");
    clearmacs->setMaximumSize(Qt::Size(150, 32767));
    clearmacs_font = Qt::Font(clearmacs->font);
    clearmacs_font->setFamily("Helvetica");
    clearmacs->setFont(clearmacs_font);
    clearmacs->setText(trUtf8("Clear Unassigned MACs"));
    $layout52->addWidget(clearmacs);
    $layout53->addLayout($layout52);

    my $layout32 = Qt::VBoxLayout(undef, 11, 6, '$layout32');

    collectionmethodselect = Qt::ButtonGroup(centralWidget(), "collectionmethodselect");
    collectionmethodselect->setSizePolicy(Qt::SizePolicy(3, 1, 0, 0, collectionmethodselect->sizePolicy()->hasHeightForWidth()));
    collectionmethodselect->setMinimumSize(Qt::Size(85, 80));
    collectionmethodselect->setMaximumSize(Qt::Size(200, 80));
    collectionmethodselect->setFrameShape(&Qt::ButtonGroup::NoFrame);
    collectionmethodselect->setTitle(trUtf8("Collection Method"));
    collectionmethodselect->setAlignment(int(&Qt::ButtonGroup::AlignTop | &Qt::ButtonGroup::AlignHCenter));
    collectionmethodselect->setColumnLayout( 0, &Vertical );
    collectionmethodselect->layout()->setSpacing(0);
    collectionmethodselect->layout()->setMargin(8);
    my $collectionmethodselectLayout = Qt::GridLayout(collectionmethodselect->layout() );
    $collectionmethodselectLayout->setAlignment( &AlignTop );

    manualcollect = Qt::RadioButton(collectionmethodselect, "manualcollect");
    manualcollect->setText(trUtf8("Manual"));
    collectionmethodselect->insert( manualcollect,int(2));

    $collectionmethodselectLayout->addWidget(manualcollect, 2, 0);

    filecollect = Qt::RadioButton(collectionmethodselect, "filecollect");
    filecollect->setText(trUtf8("File"));

    $collectionmethodselectLayout->addWidget(filecollect, 1, 0);

    networkcollect = Qt::RadioButton(collectionmethodselect, "networkcollect");
    networkcollect->setText(trUtf8("Network"));
    networkcollect->setChecked(1);
    collectionmethodselect->insert( networkcollect,int(0));

    $collectionmethodselectLayout->addWidget(networkcollect, 0, 0);
    $layout32->addWidget(collectionmethodselect);

    collectionmethod = QWidgetStack(centralWidget(), "collectionmethod");
    collectionmethod->setSizePolicy(Qt::SizePolicy(3, 5, 0, 0, collectionmethod->sizePolicy()->hasHeightForWidth()));
    collectionmethod->setMinimumSize(Qt::Size(200, 0));
    collectionmethod->setMaximumSize(Qt::Size(250, 32767));

    network = Qt::Widget(collectionmethod, "network");
    my $networkLayout = Qt::GridLayout(network, 1, 1, 0, 0, '$networkLayout');

    my $layout27 = Qt::VBoxLayout(undef, 11, 1, '$layout27');

    my $layout25 = Qt::HBoxLayout(undef, 0, 0, '$layout25');

    my $layout24 = Qt::VBoxLayout(undef, 0, 1, '$layout24');

    straytounass = Qt::PushButton(network, "straytounass");
    straytounass->setSizePolicy(Qt::SizePolicy(1, 3, 1, 1, straytounass->sizePolicy()->hasHeightForWidth()));
    straytounass->setMinimumSize(Qt::Size(30, 30));
    straytounass->setMaximumSize(Qt::Size(30, 32767));
    straytounass->setText(trUtf8("<"));
    Qt::ToolTip::add(straytounass, trUtf8("Return MAC to Unassigned"));
    $layout24->addWidget(straytounass);

    allstraytounass = Qt::PushButton(network, "allstraytounass");
    allstraytounass->setSizePolicy(Qt::SizePolicy(1, 3, 1, 1, allstraytounass->sizePolicy()->hasHeightForWidth()));
    allstraytounass->setMinimumSize(Qt::Size(30, 30));
    allstraytounass->setMaximumSize(Qt::Size(30, 32767));
    allstraytounass->setText(trUtf8("<<"));
    Qt::ToolTip::add(allstraytounass, trUtf8("Return All MACs to Unassigned"));
    $layout24->addWidget(allstraytounass);

    unasstostray = Qt::PushButton(network, "unasstostray");
    unasstostray->setSizePolicy(Qt::SizePolicy(1, 3, 1, 1, unasstostray->sizePolicy()->hasHeightForWidth()));
    unasstostray->setMinimumSize(Qt::Size(30, 30));
    unasstostray->setMaximumSize(Qt::Size(30, 32767));
    unasstostray->setText(trUtf8(">"));
    Qt::ToolTip::add(unasstostray, trUtf8("Move to Stray"));
    $layout24->addWidget(unasstostray);

    allunasstostray = Qt::PushButton(network, "allunasstostray");
    allunasstostray->setSizePolicy(Qt::SizePolicy(1, 3, 1, 1, allunasstostray->sizePolicy()->hasHeightForWidth()));
    allunasstostray->setMinimumSize(Qt::Size(30, 30));
    allunasstostray->setMaximumSize(Qt::Size(30, 32767));
    allunasstostray->setText(trUtf8(">>"));
    Qt::ToolTip::add(allunasstostray, trUtf8("Move All Unassigned MACs to Stray"));
    $layout24->addWidget(allunasstostray);
    $layout25->addLayout($layout24);

    my $layout61 = Qt::VBoxLayout(undef, 0, 0, '$layout61');

    textLabel3_3 = Qt::Label(network, "textLabel3_3");
    textLabel3_3->setSizePolicy(Qt::SizePolicy(3, 1, 1, 1, textLabel3_3->sizePolicy()->hasHeightForWidth()));
    textLabel3_3->setMinimumSize(Qt::Size(70, 20));
    textLabel3_3_font = Qt::Font(textLabel3_3->font);
    textLabel3_3_font->setFamily("Helvetica");
    textLabel3_3->setFont(textLabel3_3_font);
    textLabel3_3->setText(trUtf8("Stray MAC Addresses"));
    textLabel3_3->setAlignment(int(&Qt::Label::AlignCenter));
    $layout61->addWidget(textLabel3_3);

    straymacs = Qt::ListBox(network, "straymacs");
    straymacs->setSizePolicy(Qt::SizePolicy(3, 3, 3, 3, straymacs->sizePolicy()->hasHeightForWidth()));
    straymacs->setMinimumSize(Qt::Size(50, 100));
    straymacs_font = Qt::Font(straymacs->font);
    straymacs_font->setFamily("Helvetica");
    straymacs->setFont(straymacs_font);
    $layout61->addWidget(straymacs);
    $layout25->addLayout($layout61);
    $layout27->addLayout($layout25);

    my $layout26 = Qt::HBoxLayout(undef, 0, 0, '$layout26');

    startcollect = Qt::PushButton(network, "startcollect");
    startcollect->setEnabled(1);
    startcollect->setText(trUtf8("Start Collection"));
    $layout26->addWidget(startcollect);

    stopcollect = Qt::PushButton(network, "stopcollect");
    stopcollect->setEnabled(0);
    stopcollect->setText(trUtf8("Stop Collection"));
    $layout26->addWidget(stopcollect);
    $layout27->addLayout($layout26);

    $networkLayout->addLayout($layout27, 0, 0);

    file = Qt::Widget(collectionmethod, "file");
    my $fileLayout = Qt::GridLayout(file, 1, 1, 0, 0, '$fileLayout');

    my $layout29 = Qt::VBoxLayout(undef, 0, 0, '$layout29');

    my $layout28 = Qt::HBoxLayout(undef, 0, 0, '$layout28');

    importmacfile = Qt::LineEdit(file, "importmacfile");
    importmacfile->setSizePolicy(Qt::SizePolicy(7, 1, 0, 0, importmacfile->sizePolicy()->hasHeightForWidth()));
    importmacfile->setMinimumSize(Qt::Size(60, 30));
    importmacfile->setMaximumSize(Qt::Size(32767, 30));
    $layout28->addWidget(importmacfile);

    importfilebrowse = Qt::PushButton(file, "importfilebrowse");
    importfilebrowse->setSizePolicy(Qt::SizePolicy(1, 1, 0, 0, importfilebrowse->sizePolicy()->hasHeightForWidth()));
    importfilebrowse->setMinimumSize(Qt::Size(50, 30));
    importfilebrowse->setMaximumSize(Qt::Size(32767, 30));
    importfilebrowse->setText(trUtf8("Browse..."));
    $layout28->addWidget(importfilebrowse);
    $layout29->addLayout($layout28);

    importmacs = Qt::PushButton(file, "importmacs");
    importmacs->setSizePolicy(Qt::SizePolicy(1, 1, 0, 0, importmacs->sizePolicy()->hasHeightForWidth()));
    importmacs->setMinimumSize(Qt::Size(0, 30));
    importmacs->setMaximumSize(Qt::Size(32767, 30));
    importmacs_font = Qt::Font(importmacs->font);
    importmacs->setFont(importmacs_font);
    importmacs->setText(trUtf8("&Import MAC Addresses from file"));
    $layout29->addWidget(importmacs);

    $fileLayout->addLayout($layout29, 0, 0);

    manual = Qt::Widget(collectionmethod, "manual");
    my $manualLayout = Qt::GridLayout(manual, 1, 1, 0, 0, '$manualLayout');

    my $layout31 = Qt::VBoxLayout(undef, 0, 0, '$layout31');

    my $layout30 = Qt::VBoxLayout(undef, 0, 0, '$layout30');

    textLabel1 = Qt::Label(manual, "textLabel1");
    textLabel1->setSizePolicy(Qt::SizePolicy(5, 1, 0, 0, textLabel1->sizePolicy()->hasHeightForWidth()));
    textLabel1->setMinimumSize(Qt::Size(0, 40));
    textLabel1->setMaximumSize(Qt::Size(32767, 50));
    textLabel1_font = Qt::Font(textLabel1->font);
    textLabel1_font->setFamily("Helvetica");
    textLabel1->setFont(textLabel1_font);
    textLabel1->setText(trUtf8("Enter MAC Address in form\n" .
    "01:23:45:67:89:ab"));
    textLabel1->setAlignment(int(&Qt::Label::AlignCenter));
    $layout30->addWidget(textLabel1);

    manualmac = Qt::LineEdit(manual, "manualmac");
    manualmac->setSizePolicy(Qt::SizePolicy(7, 1, 0, 0, manualmac->sizePolicy()->hasHeightForWidth()));
    manualmac->setMinimumSize(Qt::Size(0, 30));
    manualmac->setMaximumSize(Qt::Size(32767, 30));
    manualmac->setMaxLength(int(17));
    $layout30->addWidget(manualmac);
    $layout31->addLayout($layout30);

    importmanualmac = Qt::PushButton(manual, "importmanualmac");
    importmanualmac->setText(trUtf8("&Import MAC"));
    $layout31->addWidget(importmanualmac);

    $manualLayout->addLayout($layout31, 0, 0);
    $layout32->addWidget(collectionmethod);
    $layout53->addLayout($layout32);
    $layout54->addLayout($layout53);

    autoassignGroup = Qt::ButtonGroup(centralWidget(), "autoassignGroup");
    autoassignGroup->setSizePolicy(Qt::SizePolicy(3, 3, 0, 0, autoassignGroup->sizePolicy()->hasHeightForWidth()));
    autoassignGroup->setMinimumSize(Qt::Size(312, 62));
    autoassignGroup->setMaximumSize(Qt::Size(320, 70));
    autoassignGroup->setTitle(trUtf8("Automatic MAC Address Assignment"));
    autoassignGroup->setAlignment(int(&Qt::ButtonGroup::AlignAuto));
    autoassignGroup->setColumnLayout( 0, &Vertical );
    autoassignGroup->layout()->setSpacing(0);
    autoassignGroup->layout()->setMargin(5);
    my $autoassignGroupLayout = Qt::GridLayout(autoassignGroup->layout() );
    $autoassignGroupLayout->setAlignment( &AlignTop );

    my $layout10 = Qt::VBoxLayout(undef, 0, 0, '$layout10');

    autodefine = Qt::CheckBox(autoassignGroup, "autodefine");
    autodefine->setSizePolicy(Qt::SizePolicy(1, 1, 0, 0, autodefine->sizePolicy()->hasHeightForWidth()));
    autodefine_font = Qt::Font(autodefine->font);
    autodefine->setFont(autodefine_font);
    autodefine->setText(trUtf8("Auto-define new nodes upon MAC collection"));
    $layout10->addWidget(autodefine);

    my $layout9 = Qt::HBoxLayout(undef, 0, 0, '$layout9');
    my $spacer_2 = Qt::SpacerItem(20, 10, &Qt::SizePolicy::Fixed, &Qt::SizePolicy::Minimum);
    $layout9->addItem($spacer_2);

    assignblanksfirst = Qt::CheckBox(autoassignGroup, "assignblanksfirst");
    assignblanksfirst->setEnabled(0);
    assignblanksfirst->setSizePolicy(Qt::SizePolicy(1, 1, 0, 0, assignblanksfirst->sizePolicy()->hasHeightForWidth()));
    assignblanksfirst_font = Qt::Font(assignblanksfirst->font);
    assignblanksfirst->setFont(assignblanksfirst_font);
    assignblanksfirst->setText(trUtf8("Assign to nodes without a MAC address first"));
    assignblanksfirst->setChecked(1);
    $layout9->addWidget(assignblanksfirst);
    $layout10->addLayout($layout9);

    $autoassignGroupLayout->addLayout($layout10, 0, 0);
    $layout54->addWidget(autoassignGroup);
    $layout55->addLayout($layout54);
    $layout56->addLayout($layout55);

    my $layout49 = Qt::HBoxLayout(undef, 2, 5, '$layout49');

    deletenode = Qt::PushButton(centralWidget(), "deletenode");
    deletenode->setEnabled(0);
    deletenode->setSizePolicy(Qt::SizePolicy(3, 0, 1, 0, deletenode->sizePolicy()->hasHeightForWidth()));
    deletenode->setMinimumSize(Qt::Size(80, 30));
    deletenode->setMaximumSize(Qt::Size(150, 30));
    deletenode_font = Qt::Font(deletenode->font);
    deletenode_font->setFamily("Helvetica");
    deletenode->setFont(deletenode_font);
    deletenode->setText(trUtf8("Delete Node"));
    $layout49->addWidget(deletenode);

    my $layout62 = Qt::HBoxLayout(undef, 1, 3, '$layout62');

    definenodesButton = Qt::PushButton(centralWidget(), "definenodesButton");
    definenodesButton->setSizePolicy(Qt::SizePolicy(1, 0, 0, 0, definenodesButton->sizePolicy()->hasHeightForWidth()));
    definenodesButton->setMinimumSize(Qt::Size(50, 30));
    definenodesButton->setMaximumSize(Qt::Size(100, 30));
    definenodesButton_font = Qt::Font(definenodesButton->font);
    definenodesButton_font->setFamily("Helvetica");
    definenodesButton->setFont(definenodesButton_font);
    definenodesButton->setText(trUtf8("Define"));
    $layout62->addWidget(definenodesButton);

    definenodesnum = Qt::SpinBox(centralWidget(), "definenodesnum");
    definenodesnum->setSizePolicy(Qt::SizePolicy(1, 0, 0, 0, definenodesnum->sizePolicy()->hasHeightForWidth()));
    definenodesnum->setMinimumSize(Qt::Size(50, 30));
    definenodesnum->setMaximumSize(Qt::Size(100, 30));
    definenodesnum_font = Qt::Font(definenodesnum->font);
    definenodesnum->setFont(definenodesnum_font);
    definenodesnum->setPrefix(trUtf8(""));
    definenodesnum->setButtonSymbols(&Qt::SpinBox::UpDownArrows);
    definenodesnum->setMaxValue(int(5000));
    definenodesnum->setMinValue(int(1));
    $layout62->addWidget(definenodesnum);

    textLabel2_2 = Qt::Label(centralWidget(), "textLabel2_2");
    textLabel2_2->setSizePolicy(Qt::SizePolicy(3, 0, 0, 0, textLabel2_2->sizePolicy()->hasHeightForWidth()));
    textLabel2_2->setMinimumSize(Qt::Size(40, 30));
    textLabel2_2->setMaximumSize(Qt::Size(80, 30));
    textLabel2_2_font = Qt::Font(textLabel2_2->font);
    textLabel2_2->setFont(textLabel2_2_font);
    textLabel2_2->setText(trUtf8("nodes"));
    textLabel2_2->setAlignment(int(&Qt::Label::AlignVCenter | &Qt::Label::AlignLeft));
    $layout62->addWidget(textLabel2_2);
    $layout49->addLayout($layout62);
    my $spacer_3 = Qt::SpacerItem(250, 20, &Qt::SizePolicy::Expanding, &Qt::SizePolicy::Minimum);
    $layout49->addItem($spacer_3);

    advancedButton = Qt::PushButton(centralWidget(), "advancedButton");
    advancedButton->setSizePolicy(Qt::SizePolicy(3, 1, 0, 0, advancedButton->sizePolicy()->hasHeightForWidth()));
    advancedButton->setMinimumSize(Qt::Size(90, 30));
    advancedButton->setMaximumSize(Qt::Size(180, 30));
    advancedButton_font = Qt::Font(advancedButton->font);
    advancedButton_font->setFamily("Helvetica");
    advancedButton->setFont(advancedButton_font);
    advancedButton->setText(trUtf8("Advanced >>"));
    advancedButton->setToggleButton(1);
    advancedButton->setOn(0);
    $layout49->addWidget(advancedButton);
    $layout56->addLayout($layout49);

    my $layout51 = Qt::HBoxLayout(undef, 11, 6, '$layout51');

    backButton = Qt::PushButton(centralWidget(), "backButton");
    backButton->setEnabled(1);
    backButton->setSizePolicy(Qt::SizePolicy(1, 1, 1, 0, backButton->sizePolicy()->hasHeightForWidth()));
    backButton_font = Qt::Font(backButton->font);
    backButton->setFont(backButton_font);
    backButton->setText(trUtf8("&Back"));
    backButton->setIconSet(Qt::IconSet(uic_load_pixmap_NodeMgmtDialog("backarrow.png")));
    Qt::ToolTip::add(backButton, trUtf8("Go to the previous step of the installer"));
    $layout51->addWidget(backButton);

    closeDialog = Qt::PushButton(centralWidget(), "closeDialog");
    closeDialog->setSizePolicy(Qt::SizePolicy(1, 1, 2, 0, closeDialog->sizePolicy()->hasHeightForWidth()));
    closeDialog->setMinimumSize(Qt::Size(50, 0));
    closeDialog_font = Qt::Font(closeDialog->font);
    closeDialog_font->setFamily("Helvetica");
    closeDialog->setFont(closeDialog_font);
    closeDialog->setText(trUtf8("&Close"));
    closeDialog->setIconSet(Qt::IconSet(uic_load_pixmap_NodeMgmtDialog("close.png")));
    $layout51->addWidget(closeDialog);

    nextButton = Qt::PushButton(centralWidget(), "nextButton");
    nextButton->setEnabled(1);
    nextButton->setSizePolicy(Qt::SizePolicy(1, 1, 1, 0, nextButton->sizePolicy()->hasHeightForWidth()));
    nextButton_font = Qt::Font(nextButton->font);
    nextButton->setFont(nextButton_font);
    nextButton->setText(trUtf8("&Next"));
    nextButton->setIconSet(Qt::IconSet(uic_load_pixmap_NodeMgmtDialog("nextarrow.png")));
    Qt::ToolTip::add(nextButton, trUtf8("Go to the next step of the installer"));
    $layout51->addWidget(nextButton);
    $layout56->addLayout($layout51);

    $NodeMgmtDialogLayout->addLayout($layout56, 0, 0);



    Qt::Object::connect(autodefine, SIGNAL "toggled(bool)", assignblanksfirst, SLOT "setEnabled(bool)");
    Qt::Object::connect(nodesettingschange, SIGNAL "clicked()", this, SLOT "nodesettingschange_clicked()");
    Qt::Object::connect(closeDialog, SIGNAL "clicked()", this, SLOT "closeDialog_clicked()");
    Qt::Object::connect(collectionmethodselect, SIGNAL "released(int)", collectionmethod, SLOT "raiseWidget(int)");
    Qt::Object::connect(definenodesButton, SIGNAL "clicked()", this, SLOT "defineNnodes()");
    Qt::Object::connect(startcollect, SIGNAL "clicked()", this, SLOT "startnetcollection()");
    Qt::Object::connect(stopcollect, SIGNAL "clicked()", this, SLOT "stopnetcollection()");
    Qt::Object::connect(advancedButton, SIGNAL "toggled(bool)", this, SLOT "advancedButton_toggled(bool)");
    Qt::Object::connect(importfilebrowse, SIGNAL "clicked()", this, SLOT "importfilebrowse_clicked()");
    Qt::Object::connect(importmacs, SIGNAL "clicked()", this, SLOT "importmacs_clicked()");
    Qt::Object::connect(exportmacs, SIGNAL "clicked()", this, SLOT "exportmacs_clicked()");
    Qt::Object::connect(importmanualmac, SIGNAL "clicked()", this, SLOT "importmanualmac_clicked()");
    Qt::Object::connect(straytounass, SIGNAL "clicked()", this, SLOT "straytounass_clicked()");
    Qt::Object::connect(unasstostray, SIGNAL "clicked()", this, SLOT "unasstostray_clicked()");
    Qt::Object::connect(allstraytounass, SIGNAL "clicked()", this, SLOT "allstraytounass_clicked()");
    Qt::Object::connect(allunasstostray, SIGNAL "clicked()", this, SLOT "allunasstostray_clicked()");
    Qt::Object::connect(clearmacs, SIGNAL "clicked()", this, SLOT "clearmacs_clicked()");
    Qt::Object::connect(assignmac, SIGNAL "clicked()", this, SLOT "assignmac_clicked()");
    Qt::Object::connect(assignallmacs, SIGNAL "clicked()", this, SLOT "assignallmacs_clicked()");
    Qt::Object::connect(unassignmac, SIGNAL "clicked()", this, SLOT "unassignmac_clicked()");
    Qt::Object::connect(othermacs, SIGNAL "selectionChanged()", this, SLOT "othermacs_dimmer()");
    Qt::Object::connect(straymacs, SIGNAL "selectionChanged()", this, SLOT "straymacs_dimmer()");
    Qt::Object::connect(backButton, SIGNAL "clicked()", this, SLOT "backButton_clicked()");
    Qt::Object::connect(nextButton, SIGNAL "clicked()", this, SLOT "nextButton_clicked()");

    setTabOrder(othermacs, assignmac);
    setTabOrder(assignmac, unassignmac);
    setTabOrder(unassignmac, autodefine);
    setTabOrder(autodefine, assignblanksfirst);
    setTabOrder(assignblanksfirst, definenodesnum);
    setTabOrder(definenodesnum, exportmacs);

    textLabel8->setBuddy(this->othermacs);
    textLabel1->setBuddy(this->manualmac);

    init();
}


sub init
{
    
    $nodes = OSCAR::Database::database_execute_command("read_records nodes id!=1");
    @macs = ();
# set up advanced widget group as an extension
    advancedBox->hide();
    Qt::Object::connect(advancedButton,
		      SIGNAL 'toggled(bool)',
		      this,
		      SLOT 'advancedButton_toggled(bool)');
    
# set up pages of collection methods in the widgetstack
    collectionmethod->addWidget(network, 0);
    collectionmethod->addWidget(file, 1);
    collectionmethod->addWidget(manual, 2);
    
# create instance of the settings dialog
  settingsDialog = NodeSettingsDialog(this,"settingsDialog");
  Qt::Object::connect(settingsDialog->nodesettingsOK ,
		      SIGNAL 'clicked()',
		      this,
		      SLOT 'refreshsamplenode()');
  
#create instance of Qt::Process to run mac_collector
  mac_collectorProcess = Qt::Process("$ENV{OSCAR_HOME}/scripts/mac_collector", this, 'mac_collectorProcess');
  Qt::Object::connect(mac_collectorProcess,
		      SIGNAL 'processExited()',
		      this,
		      SLOT 'stopnetcollection()');
  Qt::Object::connect(mac_collectorProcess,
		      SIGNAL 'readyReadStdout()',
		      this,
		      SLOT 'getcollectedmacs()');

# If there is a parent of this window, then we are probably running
# it in the InstallerWorkspace.  Need to connect some signals/slots.
  if (parent()) {
      Qt::Object::connect(parent(),
                          SIGNAL 'signalButtonShown(char*,char*,bool)',
                          SLOT   'setButtonShown(char*,char*,bool)');
      Qt::Object::connect(parent(),
                          SIGNAL 'odaWasUpdated(char*)',
                          SLOT   'reReadOda(char*)');
  } else {
    # For Tasks, hide the Back/Next buttons if not running inside
    # the InstallerWorkspace window.
    backButton->hide();
    nextButton->hide();
  }

  
#create instance of timer for net collection
  macprocessTimer = Qt::Timer(this, "macprocessTimer");
    Qt::Object::connect(macprocessTimer,
			SIGNAL 'timeout()',
			this,
			SLOT 'processnetmacs()');
  
#insert some sample data into the boxen
  my @samplemacs = ( '11:11:11:11:11:11', '22:22:22:22:22:22', '33:33:33:33:33:33' );
  while (my $mac = pop(@samplemacs)) {
      $usedmacs{$mac} = 1;
      othermacs->insertItem($mac);
  }
  @samplemacs = ( '44:44:44:44:44:44', '55:55:55:55:55:55', '66:66:66:66:66:66' );
   while (my $mac = pop(@samplemacs)) {
      $usedmacs{$mac} = 1;
      straymacs->insertItem($mac);
  }
   
   refreshsamplenode();
   if ( $nodes ) { populate_nodetable(); }
   othermacs_dimmer();
   straymacs_dimmer();
   nodeTable->adjustColumn(2);
   nodeTable->adjustColumn(1);
   nodeTable->adjustColumn(3);
   

}

sub populate_nodetable
{

    my @results;
    my @fields = qw( nodes.name nics.ip nics.mac );
    my @wheres = qw( nodes.id!=1 nics.node_id=nodes.id );
    oda::read_records( undef, \@fields, \@wheres, \@results, 1, undef);
    for ( my $i = 0; $i < scalar(@results); $i++ ) {
	my $ref = $results[$i];	
#print "DEBUG:: adding " . $$ref{name} . " now\n";
	nodeTable->insertRows($i, 1);
	my $ip = $$ref{ip};
	my $name = $$ref{name};
	my $assmac = $$ref{mac} ? $$ref{mac} : '';
	$usedmacs{$assmac} = 1;
	my $item = Qt::TableItem(nodeTable, 0, $name);
	nodeTable->setItem($i, 1, $item);
	$item = Qt::TableItem(nodeTable, 0, $ip);
	nodeTable->setItem($i, 2, $item);
	$item = Qt::TableItem(nodeTable, 0, $assmac);
	nodeTable->setItem($i, 3, $item);
#print "DEBUG:: added " . $$ref{name} . " just now\n";
    }

}

sub advancedButton_toggled
{

    my $on = shift;
    if ( $on ) {
	advancedButton->setText("Basic <<");
	advancedBox->show();
    } else {
	advancedButton->setText("Advanced >>");
	advancedBox->hide();
    }

}

sub nodesettingschange_clicked
{

# nodesettingschange_clicked opens the node settings dialog
    
  settingsDialog->show();

}

sub refreshsamplenode
{

  nodelook->setText("The next node will be created as " . getnextnodename() );

}

sub defineNnodes
{

# defineNnodes is used by the Define ( n nodes) button
# it will define the next N nodes, where N is the value in the SpinBox
# it follows up by refreshing the sample text
    
    my $numnodes = definenodesnum->cleanText();
    definenodesnum->setValue(1);
    print "Defining $numnodes nodes\n";
    
    for( my $i = 0; $i < $numnodes; $i++ ) {
	my $nextnode = getnextnodename();
	($nextnode, my $ip) = definenode();
    }
    refreshsamplenode();

}

sub startnetcollection
{

    if ( mac_collectorProcess->start() ) {
	stopcollect->setEnabled(1);
	startcollect->setEnabled(0);
	networkcollect->setText("Network (collecting)");
	macprocessTimer->start(500);
    }

}

sub stopnetcollection
{

    macprocessTimer->stop();
    mac_collectorProcess->tryTerminate();
#    Qt::Timer::singleShot(1000, mac_collectorProcess, SLOT 'kill()' );
    stopcollect->setEnabled(0);
    startcollect->setEnabled(1);
    networkcollect->setText("Network");

}

sub processnetmacs
{

    if (scalar(@macs)) {
	foreach my $mac (@macs) {    
	    unless ( $usedmacs{$mac} == 1 ) {
		$usedmacs{$mac} = 1;
		othermacs->insertItem( $mac );
	    }
	}
	@macs = ();
    }

}

sub getcollectedmacs
{

    while (mac_collectorProcess->canReadLineStdout()) {
	while ( my $a = mac_collectorProcess->readLineStdout() ) {
	    push( @macs, $a );
	}
    }
#processnetmacs();

}

sub importfilebrowse_clicked
{

    my $file = Qt::FileDialog::getOpenFileName(
	    "$ENV{HOME}",
	    undef,
	    this,
	    "open file dialog",
	    "Choose a file" );
    importmacfile->setText($file);

}

sub importmacs_clicked
{

    my @newmacs = OSCAR::MACops::load_from_file( importmacfile->text() );
    while ( my $mac = pop(@newmacs) ) {
	unless ( $usedmacs{$mac} == 1 ) {
	    $usedmacs{$mac} = 1;	
	    othermacs->insertItem($mac);
	}
    }

}

sub exportmacs_clicked
{

    my $file = Qt::FileDialog::getSaveFileName(
	    "$ENV{HOME}",
	    undef,
	    this,
	    "save file dialog",
	    "Choose export file" );
#this currently only grabs unassigned MACs!!!    
    my @macs;
    for ( my $i=0; $i < othermacs->count; $i++ ) {
	push @macs, othermacs->text($i);
    }
    OSCAR::MACops::save_to_file($file, @macs);

}

sub importmanualmac_clicked
{

    my $mac = manualmac->text();
    if ( $mac = OSCAR::MACops::verify_mac($mac) && $usedmacs{$mac} != 1 ) {
	$usedmacs{$mac} = 1;
	othermacs->insertItem($mac);
	manualmac->clear();
    }

}

sub straytounass_clicked
{

    if ( straymacs->currentItem > -1 ) {
	othermacs->insertItem( straymacs->text( straymacs->currentItem() ) );
	straymacs->removeItem( straymacs->currentItem );
    }
    straymacs->clearSelection();
    straymacs_dimmer();
    othermacs_dimmer();

}

sub allstraytounass_clicked
{

    for ( my $i = 0; $i < straymacs->count; $i++ ) {
	othermacs->insertItem( straymacs->text( $i ) );
    }
    straymacs->clearSelection();
    straymacs->clear();
    straymacs_dimmer();
    othermacs_dimmer();   

}

sub unasstostray_clicked
{

    if ( othermacs->currentItem > -1  ) {
	straymacs->insertItem( othermacs->text( othermacs->currentItem() ) );
	othermacs->removeItem( othermacs->currentItem() );
    }
    othermacs->clearSelection();
    straymacs_dimmer();
    othermacs_dimmer();    

}

sub allunasstostray_clicked
{

    for ( my $i = 0; $i < othermacs->count; $i++ ) {
	straymacs->insertItem( othermacs->text( $i ) );
    }
    othermacs->clearSelection();
    othermacs->clear();
    straymacs_dimmer();
    othermacs_dimmer();    

}

sub clearmacs_clicked
{

    while ( my $mac = othermacs->text(0) && othermacs->removeItem(0) ) {
	delete $usedmacs{$mac};
    }
    othermacs->clearSelection();
    straymacs_dimmer();
    othermacs_dimmer();    

}

sub closeDialog_clicked
{

    stopnetcollection();
    this->close(1);

}

sub definenode
{

    my $assmac = shift;
    unless ($assmac) { $assmac = ''; }
    my $name = getnextnodename();
    my $ip = getnextnodeip();
    my $number = settingsDialog->startingnum->text;
    $number++;
    settingsDialog->startingnum->setText( $number );
    settingsDialog->setundopoint();
    
    nodeTable->insertRows($nodes, 1);
    my $item = Qt::TableItem(nodeTable, 0, $name);
    nodeTable->setItem($nodes, 1, $item);
    $item = Qt::TableItem(nodeTable, 0, $ip);
    nodeTable->setItem($nodes, 2, $item);
    $item = Qt::TableItem(nodeTable, 0, $assmac);
    nodeTable->setItem($nodes, 3, $item);
    
    nodeTable->adjustColumn(2);
    nodeTable->adjustColumn(1);
    nodeTable->adjustColumn(3);
    my $interface = NodeSettingsDialog->interface->currentText();
    
    OSCAR::Database::database_execute_command("create_node $name", undef, undef);
    OSCAR::Database::database_execute_command(
	    "create_nic_on_node $interface $name ip~$ip mac~$assmac", undef, undef);
    
    $nodes++;
    return $name, $ip;

}

sub getnextnodeip
{

# getnextnodeip will define a single node
# it returns the IP of the next node to be defined
# and increments the IP
    
#this line is waiting for the next_node_ip code
    my $nodeip = settingsDialog->startingip->text;
    my @ip = split(/\./,$nodeip);
    $ip[3]++;
    settingsDialog->startingip->setText(join('.',@ip));
    settingsDialog->setundopoint();
    return $nodeip;

}

sub getnextnodename
{

# getnextnodename calculates the name of the next node
# given the current settings of prefix, padding, and number
    
    my $prefix = settingsDialog->nameprefix->text;
    my $padding = settingsDialog->padding->text;
    my $startingnum = settingsDialog->startingnum->text;
    
    my $nextname = $prefix;
    
    if ( length($startingnum) < $padding ) {
	for ( my $i = 0; $i + length($startingnum) < $padding; $i++ ) {
	    $nextname .= '0';
	}
    }
    $nextname .= $startingnum;
    return $nextname;

}

sub assignmac_clicked
{

    my $assmac = othermacs->currentText();
    if ( ! $assmac ) {   #no current MAC selected
	return 1;
    }  elsif ( nodeTable->currentSelection == -1 ) { #MAC selected, no node selected
        if ( autodefine->isChecked() && assignblanksfirst->isChecked() ) {
	my $blank = 0;
	print "NYI: Assign MAC, MAC selected, no node selection, assignblanksfirst\n";
	return 1;
        } elsif ( autodefine->isChecked() ) {
	definenode($assmac);
	othermacs->removeItem(othermacs->currentItem());
	othermacs->clearSelection();
	return 0;
        } else { # no auto-define set, so nothing to do
	return 1;
        }
    } else { # MAC selected and node selected
	othermacs->removeItem(othermacs->currentItem());
	othermacs->clearSelection();
	my $row = nodeTable->currentRow;
	my $oldmac = nodeTable->text( $row, 3 );
	my $name = nodeTable->text( $row, 1 );
	my @results;
	OSCAR::Database::database_execute_command("list_nics_on_node $name", 
						  \@results, undef);
	my $interface = $results[0];
	if ( $oldmac ) {
	    othermacs->insertItem($oldmac);
	}
	nodeTable->setText( $row, 3, $assmac );
	OSCAR::Database::database_execute_command("modify_records nics.mac~$assmac nodes.name=$name nics.node_id=nodes.id nics.name=$interface", undef, undef);
    }

}

sub assignallmacs_clicked
{

    if ( othermacs->count > 0 ) { 
	nodeTable->clearSelection;
	othermacs->clearSelection();
    } else { #nothing to do
	return 1;
    }
    my @assmacs;
    for ( my $i = 0; $i < othermacs->count; $i++) {
	push( @assmacs, othermacs->text($i) );
    }
    @assmacs = reverse(@assmacs);
    othermacs->clear();
    
    if ( autodefine->isChecked() && assignblanksfirst->isChecked() ) {
	print "NYI: assignall, assignblanksfirst\n";
    } elsif ( autodefine->isChecked() ) {
        while ( my $assmac = pop(@assmacs) ) {
	    definenode( $assmac );
        }
    } else {
	NODE: for ( my $i = 0; $i < $nodes; $i++ ) {
	    if ( nodeTable->text($i, 3) eq '' ) {
		my $assmac = pop(@assmacs) or last NODE;
		my $name = nodeTable->text( $i, 1 );
		my @results;
		OSCAR::Database::database_execute_command("list_nics_on_node $name",   \@results, undef);
		my $interface = $results[0];
		nodeTable->setText( $i, 3, $assmac );
		OSCAR::Database::database_execute_command("modify_records nics.mac~$assmac nodes.name=$name nics.node_id=nodes.id nics.name=$interface", undef, undef);
	    }
	}
    }
    if ( scalar(@assmacs) ) { 
	@assmacs = reverse(@assmacs);
	foreach (@assmacs) {
	    othermacs->insertItem( $_ ); 
	}
    }

}

sub unassignmac_clicked
{

    my $row = nodeTable->currentRow;
     if ( $row == -1 ) { #no node selected
	return 0;
    } else {
	my $unassmac = nodeTable->text( $row, 3 );
	nodeTable->clearSelection();
	unless ( $unassmac eq "" ) {
	    nodeTable->setText( $row, 3, "" );
	    my $name = nodeTable->text( $row, 1 );
	    my @results;
	    OSCAR::Database::database_execute_command("list_nics_on_node $name", \@results, undef);
	    my $interface = $results[0];
	    OSCAR::Database::database_execute_command("modify_records nics.mac~null nodes.name=$name nics.node_id=nodes.id nics.name=$interface", undef, undef);
	    othermacs->insertItem( $unassmac );
	}
    }

}

sub othermacs_dimmer
{

    if ( othermacs->currentItem == -1 ) { 
	assignmac->setEnabled(0);
	unasstostray->setEnabled(0);
    } else {
	assignmac->setEnabled(1);
	
	unasstostray->setEnabled(1);
    }

}

sub straymacs_dimmer
{

    if ( straymacs->currentItem == -1 ) {
	straytounass->setEnabled(0);
    } else {
	straytounass->setEnabled(1);
    }

}

sub closeEvent
{

#########################################################################
#  Subroutine: closeEvent                                               #
#  Parameter : A pointer to the QCloseEvent generated.                  #
#  Returns   : Nothing                                                  #
#########################################################################
    
  # Send a signal to the parent workspace letting it know we are closing.
  emit taskToolClosing("NodeMgmt");
  SUPER->closeEvent(@_);   # Call the parent's closeEvent

}

sub backButton_clicked
{

   emit backButtonWasClicked("NodeMgmt");

}

sub nextButton_clicked
{

   emit nextButtonWasClicked("NodeMgmt");


}

sub setButtonShown
{

#########################################################################
#  Subroutine: setButtonShown                                           #
#  Parameters: (1) The directory name of the target Task for the signal #
#              (2) The name of the button to show/hide ("Back"/"Next")  #
#              (3) 1 = Show / 0 = Hide                                  #
#  Returns   : Nothing                                                  #
#  This subroutine (SLOT) is called to show/hide the Back/Next button,  #
#  usually when the parent InstallerWorkspace says to.                  #
#########################################################################
    my ($childname,$buttonname,$shown) = @_;
      
    # Ignore Hide/Show requests to other Tasks
    return if ($childname ne "NodeMgmt");

    if ($buttonname =~ /Back/i) {
	($shown) ? backButton->show() : backButton->hide();
    } elsif ($buttonname =~ /Next/i) {
        ($shown) ? nextButton->show() : nextButton->hide();
    }

}

sub reReadOda
{

#########################################################################
#  Subroutine: reReadOda                                                #
#  Parameter : The directory name of the Task/Tool that updated oda     #
#  Returns   : Nothing                                                  #
#  This subroutine (SLOT) is called the InstallerWorkspace receives     #
#  notice that another Task/Tool updated the oda database.              #
#########################################################################
    my ($childname) = @_;
      
    # Ignore the signal if we were the one that updated oda
    return if ($childname ne "NodeMgmt");

    # Reread the oda database and update the GUI as necessary
    # ...

}

1;
