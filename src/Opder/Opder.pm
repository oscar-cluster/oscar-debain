# Form implementation generated from reading ui file 'Opder.ui'
#
# Created: Thu Dec 23 15:36:07 2004
#      by: The PerlQt User Interface Compiler (puic)
#
# WARNING! All changes made in this file will be lost!


use strict;
use utf8;


package Opder;
use Qt;
use OpderTable;
use Qt::isa qw(Qt::MainWindow);
use Qt::slots
    init => [],
    closeButton_clicked => [],
    refreshButton_clicked => [],
    downloadButton_clicked => [],
    backButton_clicked => [],
    nextButton_clicked => [],
    closeMenuItem_activated => [],
    addRepositoryMenuItem_activated => [],
    updateTextBox => [],
    rowSelectionChanged => [],
    disableDownloadButton => [],
    updateDownloadButton => [],
    setRefreshButton => ['int'],
    setButtonShown => ['char*', 'char*', 'bool'],
    closeEvent => ['QCloseEvent*'],
    reReadOda => ['char*'];
use Qt::signals
    taskToolClosing => ['char*'],
    backButtonWasClicked => ['char*'],
    nextButtonWasClicked => ['char*'];
use Qt::attributes qw(
    refreshButton
    refreshButton_font
    downloadButton
    downloadButton_font
    packageTable
    packageTabWidget
    informationTab
    informationTextBox
    providesTab
    providesTextBox
    conflictsTab
    conflictsTextBox
    requiresTab
    requiresTextBox
    packagerTab
    packagerTextBox
    backButton
    backButton_font
    closeButton
    closeButton_font
    nextButton
    nextButton_font
    menubar
    PopupMenu
    addRepositoryMenuItem
    closeMenuItem
);

use Qt::attributes qw( downloadInfoForm downloadPackageForm addRepositoryForm );;
use OpderDownloadInfo;;
use lib "../Installer"; use InstallerImages;;
use OpderAddRepository;;
use OpderDownloadPackage;;

sub uic_load_pixmap_Opder
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
        setName("Opder");
    }
    resize(676,519);
    setCaption(trUtf8("OSCAR Package Downloader"));

    setCentralWidget(Qt::Widget(this, "qt_central_widget"));
    my $OpderLayout = Qt::GridLayout(centralWidget(), 1, 1, 1, 0, '$OpderLayout');

    my $layout14 = Qt::VBoxLayout(undef, 11, 6, '$layout14');

    my $layout10 = Qt::HBoxLayout(undef, 11, 6, '$layout10');

    refreshButton = Qt::PushButton(centralWidget(), "refreshButton");
    refreshButton->setSizePolicy(Qt::SizePolicy(1, 1, 0, 0, refreshButton->sizePolicy()->hasHeightForWidth()));
    refreshButton_font = Qt::Font(refreshButton->font);
    refreshButton->setFont(refreshButton_font);
    refreshButton->setText(trUtf8("&Refresh Table"));
    refreshButton->setIconSet(Qt::IconSet(uic_load_pixmap_Opder("getinfo.png")));
    Qt::ToolTip::add(refreshButton, trUtf8("Get package information from OSCAR repositories"));
    $layout10->addWidget(refreshButton);

    downloadButton = Qt::PushButton(centralWidget(), "downloadButton");
    downloadButton->setSizePolicy(Qt::SizePolicy(1, 1, 0, 0, downloadButton->sizePolicy()->hasHeightForWidth()));
    downloadButton_font = Qt::Font(downloadButton->font);
    downloadButton->setFont(downloadButton_font);
    downloadButton->setText(trUtf8("&Download Selected Packages"));
    downloadButton->setIconSet(Qt::IconSet(uic_load_pixmap_Opder("download.png")));
    Qt::ToolTip::add(downloadButton, trUtf8("Download selected packages from respositories and install on local disk"));
    $layout10->addWidget(downloadButton);
    $layout14->addLayout($layout10);

    packageTable = OpderTable(centralWidget(), "packageTable");
    packageTable->setSizePolicy(Qt::SizePolicy(7, 7, 0, 3, packageTable->sizePolicy()->hasHeightForWidth()));
    $layout14->addWidget(packageTable);

    packageTabWidget = Qt::TabWidget(centralWidget(), "packageTabWidget");
    packageTabWidget->setSizePolicy(Qt::SizePolicy(7, 7, 0, 2, packageTabWidget->sizePolicy()->hasHeightForWidth()));
    packageTabWidget->setTabShape(&Qt::TabWidget::Triangular);
    Qt::ToolTip::add(packageTabWidget, trUtf8("Display of information about the package selected above"));

    informationTab = Qt::Widget(packageTabWidget, "informationTab");
    my $informationTabLayout = Qt::GridLayout(informationTab, 1, 1, 0, 0, '$informationTabLayout');

    informationTextBox = Qt::TextEdit(informationTab, "informationTextBox");
    informationTextBox->setReadOnly(1);

    $informationTabLayout->addWidget(informationTextBox, 0, 0);
    packageTabWidget->insertTab(informationTab, trUtf8("Information"));

    providesTab = Qt::Widget(packageTabWidget, "providesTab");
    my $providesTabLayout = Qt::GridLayout(providesTab, 1, 1, 0, 0, '$providesTabLayout');

    providesTextBox = Qt::TextEdit(providesTab, "providesTextBox");
    providesTextBox->setReadOnly(1);

    $providesTabLayout->addWidget(providesTextBox, 0, 0);
    packageTabWidget->insertTab(providesTab, trUtf8("Provides"));

    conflictsTab = Qt::Widget(packageTabWidget, "conflictsTab");
    my $conflictsTabLayout = Qt::GridLayout(conflictsTab, 1, 1, 0, 0, '$conflictsTabLayout');

    conflictsTextBox = Qt::TextEdit(conflictsTab, "conflictsTextBox");
    conflictsTextBox->setReadOnly(1);

    $conflictsTabLayout->addWidget(conflictsTextBox, 0, 0);
    packageTabWidget->insertTab(conflictsTab, trUtf8("Conflicts"));

    requiresTab = Qt::Widget(packageTabWidget, "requiresTab");
    my $requiresTabLayout = Qt::GridLayout(requiresTab, 1, 1, 0, 0, '$requiresTabLayout');

    requiresTextBox = Qt::TextEdit(requiresTab, "requiresTextBox");
    requiresTextBox->setReadOnly(1);

    $requiresTabLayout->addWidget(requiresTextBox, 0, 0);
    packageTabWidget->insertTab(requiresTab, trUtf8("Requires"));

    packagerTab = Qt::Widget(packageTabWidget, "packagerTab");
    my $packagerTabLayout = Qt::GridLayout(packagerTab, 1, 1, 0, 0, '$packagerTabLayout');

    packagerTextBox = Qt::TextEdit(packagerTab, "packagerTextBox");
    packagerTextBox->setReadOnly(1);

    $packagerTabLayout->addWidget(packagerTextBox, 0, 0);
    packageTabWidget->insertTab(packagerTab, trUtf8("Packager"));
    $layout14->addWidget(packageTabWidget);

    my $layout13 = Qt::HBoxLayout(undef, 11, 6, '$layout13');

    backButton = Qt::PushButton(centralWidget(), "backButton");
    backButton->setEnabled(1);
    backButton->setSizePolicy(Qt::SizePolicy(1, 1, 1, 0, backButton->sizePolicy()->hasHeightForWidth()));
    backButton_font = Qt::Font(backButton->font);
    backButton->setFont(backButton_font);
    backButton->setText(trUtf8("&Back"));
    backButton->setIconSet(Qt::IconSet(uic_load_pixmap_Opder("backarrow.png")));
    Qt::ToolTip::add(backButton, trUtf8("Go to the previous step of the installer"));
    $layout13->addWidget(backButton);

    closeButton = Qt::PushButton(centralWidget(), "closeButton");
    closeButton->setSizePolicy(Qt::SizePolicy(1, 1, 2, 0, closeButton->sizePolicy()->hasHeightForWidth()));
    closeButton_font = Qt::Font(closeButton->font);
    closeButton->setFont(closeButton_font);
    closeButton->setText(trUtf8("&Close"));
    closeButton->setIconSet(Qt::IconSet(uic_load_pixmap_Opder("close.png")));
    Qt::ToolTip::add(closeButton, trUtf8("Exit the OSCAR Package Downloader"));
    $layout13->addWidget(closeButton);

    nextButton = Qt::PushButton(centralWidget(), "nextButton");
    nextButton->setEnabled(1);
    nextButton->setSizePolicy(Qt::SizePolicy(1, 1, 1, 0, nextButton->sizePolicy()->hasHeightForWidth()));
    nextButton_font = Qt::Font(nextButton->font);
    nextButton->setFont(nextButton_font);
    nextButton->setText(trUtf8("&Next"));
    nextButton->setIconSet(Qt::IconSet(uic_load_pixmap_Opder("nextarrow.png")));
    Qt::ToolTip::add(nextButton, trUtf8("Go to the next step of the installer"));
    $layout13->addWidget(nextButton);
    $layout14->addLayout($layout13);

    $OpderLayout->addLayout($layout14, 0, 0);

    addRepositoryMenuItem= Qt::Action(this, "addRepositoryMenuItem");
    addRepositoryMenuItem->setText(trUtf8("&Use Additional Repositories..."));
    addRepositoryMenuItem->setMenuText(trUtf8("&Use Additional Repositories..."));
    addRepositoryMenuItem->setToolTip(trUtf8("Specify URLs for additional OPD repositories"));
    closeMenuItem= Qt::Action(this, "closeMenuItem");
    closeMenuItem->setText(trUtf8("&Close"));
    closeMenuItem->setMenuText(trUtf8("&Close"));
    closeMenuItem->setToolTip(trUtf8("Close The OSCAR Package Downloader"));
    closeMenuItem->setStatusTip(trUtf8("Close the OSCAR Package Downloader"));




    menubar= Qt::MenuBar( this, "menubar");

    PopupMenu= Qt::PopupMenu(this);
    addRepositoryMenuItem->addTo(PopupMenu);
    PopupMenu->insertSeparator;
    closeMenuItem->addTo(PopupMenu);
    menubar->insertItem(trUtf8("&Actions"), PopupMenu);



    Qt::Object::connect(nextButton, SIGNAL "clicked()", this, SLOT "nextButton_clicked()");
    Qt::Object::connect(downloadButton, SIGNAL "clicked()", this, SLOT "downloadButton_clicked()");
    Qt::Object::connect(refreshButton, SIGNAL "clicked()", this, SLOT "refreshButton_clicked()");
    Qt::Object::connect(addRepositoryMenuItem, SIGNAL "activated()", this, SLOT "addRepositoryMenuItem_activated()");
    Qt::Object::connect(closeButton, SIGNAL "clicked()", this, SLOT "closeButton_clicked()");
    Qt::Object::connect(closeMenuItem, SIGNAL "activated()", this, SLOT "closeMenuItem_activated()");
    Qt::Object::connect(backButton, SIGNAL "clicked()", this, SLOT "backButton_clicked()");

    init();
}


sub init
{

#########################################################################
#  Subroutine: init                                                     #
#  Parameters: None                                                     #
#  Returns   : Nothing                                                  #
#  This code gets called after the widget is created but before it gets #
#  displayed.  This is so we can set up all the connections for SIGNALs #
#  and SLOTs.  Also, since all of the objects seem to need access to    #
#  all the other objects, pass references around.                       #
#  the packageTable, as well as any other setup work.                   #
#########################################################################

  # Create all of the form windows
  downloadInfoForm = OpderDownloadInfo(this,"downloadInfoForm");
  downloadPackageForm = OpderDownloadPackage(this,"downloadPackageForm");
  addRepositoryForm = OpderAddRepository(this,"addRepositoryForm");

  # Connect the SIGNALs and SLOTs
  Qt::Object::connect(packageTable,        SIGNAL 'selectionChanged()',
                      this,                SLOT   'rowSelectionChanged()');
  Qt::Object::connect(packageTable,        SIGNAL 'downloadButtonDisable()',
                      this,                SLOT   'disableDownloadButton()');
  Qt::Object::connect(packageTable,        SIGNAL 'downloadButtonUpdate()',
                      this,                SLOT   'updateDownloadButton()');
  Qt::Object::connect(downloadInfoForm,    SIGNAL 'readPackagesSuccess()',
                      packageTable,        SLOT   'populateTable()');
  Qt::Object::connect(downloadInfoForm,    SIGNAL 'downloadButtonDisable()',
                      this            ,    SLOT   'disableDownloadButton()');
  Qt::Object::connect(downloadInfoForm,    SIGNAL 'downloadButtonUpdate()',
                      this,                SLOT   'updateDownloadButton()');
  Qt::Object::connect(downloadPackageForm, SIGNAL 'downloadButtonUpdate()',
                      this,                SLOT   'updateDownloadButton()');
  Qt::Object::connect(downloadPackageForm, SIGNAL 'refreshButtonSet(int)',
                      this,                SLOT   'setRefreshButton(int)');
  Qt::Object::connect(addRepositoryForm,   SIGNAL 'refreshTableNeeded()',
                      this,                SLOT   'refreshButton_clicked()');

  # Can't download anything until something is selected
  disableDownloadButton();

  # Simulate a button click for the "Refresh Table" button to get OPD info
  Qt::Timer::singleShot(500, this, SLOT 'refreshButton_clicked()');

  # If there is a parent of this MainWindow, then we are probably running
  # it in the InstallerWorkspace.  Need to catch some signals.
  if (parent())
    {
      Qt::Object::connect(parent(),SIGNAL 'signalButtonShown(char*,char*,bool)',
                                   SLOT   'setButtonShown(char*,char*,bool)');
      Qt::Object::connect(parent(),SIGNAL 'odaWasUpdated(char*)',
                                   SLOT   'reReadOda(char*)');
    }
  else 
    { # For Tasks, hide the Back/Next buttons if not running inside
      # the InstallerWorkspace window.
      backButton->hide();
      nextButton->hide();
    }

  # When this window closes, destroy it, too
  setWFlags(getWFlags() | Qt::WDestructiveClose());

}

sub closeButton_clicked
{

#########################################################################
#  Subroutine: closeButton_clicked                                      #
#  Parameters: None                                                     #
#  Returns   : Nothing                                                  #
#  When the closeButton is clicked, quit the application.               #
#########################################################################

  this->close(1);

}

sub refreshButton_clicked
{

#########################################################################
#  Subroutine: refreshButton_clicked                                    #
#  Parameters: None                                                     #
#  Returns   : Nothing                                                  #
#  When the "Refresh Table" button is clicked, show the "Downloading    #
#  Package Information..." widget.                                      #
#########################################################################

  downloadInfoForm->show();

}

sub downloadButton_clicked
{

#########################################################################
#  Subroutine: downloadButton_clicked                                   #
#  Parameters: None                                                     #
#  Returns   : Nothing                                                  #
#  When the "Download Selected Packages" button is clicked, show the    #
#  "Downloading Package File" widget.                                   #
#########################################################################

  downloadPackageForm->show();

}

sub backButton_clicked
{

#########################################################################
#  Subroutine: backButton_clicked                                       #
#  Parameters: None                                                     #
#  Returns   : Nothing                                                  #
#########################################################################

  emit backButtonWasClicked(className());

}

sub nextButton_clicked
{

#########################################################################
#  Subroutine: nextButton_clicked                                       #
#  Parameters: None                                                     #
#  Returns   : Nothing                                                  #
#########################################################################

  emit nextButtonWasClicked(className());

}

sub closeMenuItem_activated
{

#########################################################################
#  Subroutine: closeMenuItem_activated                                  #
#  Parameters: None                                                     #
#  Returns   : Nothing                                                  #
#  This subroutine is called when the user selects Close from the File  #
#  pulldown menu.  To make things simple, we simply call the code       #
#  that gets executed when the Close button is pressed.                 #
#########################################################################

  closeButton_clicked();

}

sub addRepositoryMenuItem_activated
{

#########################################################################
#  Subroutine: addRepositoryMenuItem_activated                          #
#  Parameters: None                                                     #
#  Returns   : Nothing                                                  #
#########################################################################
  
  addRepositoryForm->show();

}

sub updateTextBox
{

#########################################################################
#  Subroutine: updateTextBox                                            #
#  Parameters: (1) Which box to update (provides/requires/conflicts)    #
#              (2) Which array position in the @readPackages            #
#  Returns   : Nothing                                                  #
#  This subroutine is called by rowSelectedChanged to update the one    #
#  of the three informational boxes providesTextBox, requiresTextBox,   #
#  or conflictsTextBox.  Give it one of "provides", "requires", or      #
#  "conflicts", and the name of the package to provide info for.        #
#########################################################################

  my $box = shift;
  my $arraypos = shift;

  my $output = "";
  my $readPackages = downloadInfoForm->getReadPackages();

  foreach my $row ( @{ @{$readPackages}[$arraypos]->{$box} } )
    {
      $output .= $row->{type} . ": " . $row->{name} . "\n"; 
    }
  # Use a sneaky 'eval' technique to choose the correct TextBox component
  my $cmd = $box . 'TextBox->setText($output)';
  eval $cmd;

}

sub rowSelectionChanged
{

#########################################################################
#  Subroutine: rowSelectedChanged                                       #
#  Parameters: None                                                     #
#  Returns   : Nothing                                                  #
#  This slot get called when a new row is selected in the packageTable. #
#  We update the five text boxes at the bottom of the window:           #
#  information (description), provides, requires, conflicts, and        #
#  packager.                                                            #
#########################################################################
  
  # Figure out which row of the table is now selected
  my $row = packageTable->selection(0)->anchorRow();

  return if ($row < 0);
  
  # Find the array position of the package in that row
  my $arraypos = packageTable->item($row,0)->text();
  my $readPackages = downloadInfoForm->getReadPackages();

  # Update the informational text boxes
  informationTextBox->setText(@{$readPackages}[$arraypos]->{description});
  updateTextBox("provides",$arraypos);
  updateTextBox("requires",$arraypos);
  updateTextBox("conflicts",$arraypos);

  # Update the packager names / emails
  # We read in the names/emails as a single string, but there might have
  # been more than one packager.  If so , the delimiter is '","'.
  my @names = split /\",\"/, @{$readPackages}[$arraypos]->{packager_name};
  my @emails = split /\",\"/, @{$readPackages}[$arraypos]->{packager_email};
  my $packagerStr = "";
  $arraypos = 0;
  for ($arraypos = 0; $arraypos <= $#names; $arraypos++)
    {
      $packagerStr .= $names[$arraypos];
      $packagerStr .= " <" . $emails[$arraypos] . ">" if 
        (length $emails[$arraypos] > 0);
      $packagerStr .= "\n";
    }
  packagerTextBox->setText($packagerStr);

}

sub disableDownloadButton
{

#########################################################################
#  Subroutine: disableDownloadButton                                    #
#  Parameters: None                                                     #
#  Returns   : Nothing                                                  #
#  This subroutine disabled the "Download Selected Packages" button.    #
#########################################################################

  downloadButton->setEnabled(0);

}

sub updateDownloadButton
{

#########################################################################
#  Subroutine: updateDownloadButton                                     #
#  Parameters: None                                                     #
#  Returns   : Nothing                                                  #
#  This subroutine is called to update the status of the "Download      #
#  Selected Package" button.  It checks to see how many check boxes     #
#  are checked in the package table.  If 0, then disable the button.    #
#  Otherwise, enable the button.                                        #
#########################################################################

  my $numchecked = 0;
  for (my $rownum = 0; $rownum < packageTable->numRows(); $rownum++)
    {
      $numchecked++ if packageTable->item($rownum,1)->isChecked();
    }
  downloadButton->setEnabled($numchecked > 0);

}

sub setRefreshButton
{

#########################################################################
#  Subroutine: setRefreshButton                                         #
#  Parameters: 1 = Enable / 0 = Disable                                 #
#  Returns   : Nothing                                                  #
#  This subroutine is called to enable/disable the "Refresh Table"      #
#  button.                                                              #
#########################################################################

  refreshButton->setEnabled(shift);

}

sub setButtonShown
{

#########################################################################
#  Subroutine: setButtonShown                                           #
#  Parameters: (1) The name of the target task/tool for the signal      #
#              (2) The name of the button to show/hide ("Back"/"Next")  #
#              (3) 1 = Show / 0 = Hide                                  #
#  Returns   : Nothing                                                  #
#  This subroutine is called to show/hide the Back/Next button,         #
#  usually when the parent InstallerWorkspace says to.                  #
#########################################################################

  my ($childname,$buttonname,$shown) = @_;
  
  # Ignore signals meant for other Tasks/Tools
  return if ($childname ne className());

  if ($buttonname =~ /Back/i)
    {
      ($shown) ? backButton->show() : backButton->hide();
    }
  elsif ($buttonname =~ /Next/i)
    {
      ($shown) ? nextButton->show() : nextButton->hide();
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
  emit taskToolClosing(className());
  SUPER->closeEvent(@_);   # Call the parent's closeEvent

}

sub reReadOda
{

#########################################################################
#  Subroutine: reReadOda                                                #
#  Parameter : The directory name of the Task/Tool that updated oda.    #
#  Returns   : Nothing                                                  #
#  This subroutine (SLOT) gets called when a Task/Tool tells the        #
#  InstallerWorkspace that the oda database has been updated.           #
#########################################################################

  my $classname = shift;
  
  # Ignore the signal if I generated it.
  return if ($classname eq className());

}

1;
