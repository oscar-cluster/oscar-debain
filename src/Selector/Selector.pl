# Form implementation generated from reading ui file 'Selector.ui'
#
# Created: Thu Dec 23 15:36:06 2004
#      by: The PerlQt User Interface Compiler (puic)
#
# WARNING! All changes made in this file will be lost!


use strict;
use utf8;


package Selector;
use Qt;
use SelectorTable;
use Qt::isa qw(Qt::MainWindow);
use Qt::slots
    init => [],
    closeButton_clicked => [],
    backButton_clicked => [],
    nextButton_clicked => [],
    updateTextBox => [],
    rowSelectionChanged => [],
    reReadOda => ['char*'],
    setButtonShown => ['char*', 'char*', 'bool'],
    closeEvent => ['QCloseEvent*'];
use Qt::signals
    taskToolClosing => ['char*'],
    backButtonWasClicked => ['char*'],
    nextButtonWasClicked => ['char*'];
use Qt::attributes qw(
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
    closeButton
    nextButton
    menubar
);

use SelectorUtils;;
use lib "../Installer"; use InstallerImages;;
use lib "$ENV{OSCAR_HOME}/lib"; use OSCAR::Database;;
use Getopt::Long;;

sub uic_load_pixmap_Selector
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
        setName("Selector");
    }
    resize(675,518);
    setCaption(trUtf8("OSCAR Package Selector/Configurator"));

    setCentralWidget(Qt::Widget(this, "qt_central_widget"));
    my $SelectorLayout = Qt::GridLayout(centralWidget(), 1, 1, 1, 0, '$SelectorLayout');

    my $layout14 = Qt::GridLayout(undef, 1, 1, 11, 6, '$layout14');

    packageTable = SelectorTable(centralWidget(), "packageTable");
    packageTable->setSizePolicy(Qt::SizePolicy(7, 7, 0, 3, packageTable->sizePolicy()->hasHeightForWidth()));

    $layout14->addWidget(packageTable, 0, 0);

    packageTabWidget = Qt::TabWidget(centralWidget(), "packageTabWidget");
    packageTabWidget->setSizePolicy(Qt::SizePolicy(7, 7, 0, 2, packageTabWidget->sizePolicy()->hasHeightForWidth()));
    packageTabWidget->setTabShape(&Qt::TabWidget::Triangular);
    Qt::ToolTip::add(packageTabWidget, trUtf8("Display of information about the package selected above"));

    informationTab = Qt::Widget(packageTabWidget, "informationTab");
    my $informationTabLayout = Qt::GridLayout(informationTab, 1, 1, 0, 6, '$informationTabLayout');

    informationTextBox = Qt::TextEdit(informationTab, "informationTextBox");
    informationTextBox->setReadOnly(1);

    $informationTabLayout->addWidget(informationTextBox, 0, 0);
    packageTabWidget->insertTab(informationTab, trUtf8("Information"));

    providesTab = Qt::Widget(packageTabWidget, "providesTab");
    my $providesTabLayout = Qt::GridLayout(providesTab, 1, 1, 0, 6, '$providesTabLayout');

    providesTextBox = Qt::TextEdit(providesTab, "providesTextBox");
    providesTextBox->setReadOnly(1);

    $providesTabLayout->addWidget(providesTextBox, 0, 0);
    packageTabWidget->insertTab(providesTab, trUtf8("Provides"));

    conflictsTab = Qt::Widget(packageTabWidget, "conflictsTab");
    my $conflictsTabLayout = Qt::GridLayout(conflictsTab, 1, 1, 0, 6, '$conflictsTabLayout');

    conflictsTextBox = Qt::TextEdit(conflictsTab, "conflictsTextBox");
    conflictsTextBox->setReadOnly(1);

    $conflictsTabLayout->addWidget(conflictsTextBox, 0, 0);
    packageTabWidget->insertTab(conflictsTab, trUtf8("Conflicts"));

    requiresTab = Qt::Widget(packageTabWidget, "requiresTab");
    my $requiresTabLayout = Qt::GridLayout(requiresTab, 1, 1, 0, 6, '$requiresTabLayout');

    requiresTextBox = Qt::TextEdit(requiresTab, "requiresTextBox");
    requiresTextBox->setReadOnly(1);

    $requiresTabLayout->addWidget(requiresTextBox, 0, 0);
    packageTabWidget->insertTab(requiresTab, trUtf8("Requires"));

    packagerTab = Qt::Widget(packageTabWidget, "packagerTab");
    my $packagerTabLayout = Qt::GridLayout(packagerTab, 1, 1, 0, 6, '$packagerTabLayout');

    packagerTextBox = Qt::TextEdit(packagerTab, "packagerTextBox");
    packagerTextBox->setReadOnly(1);

    $packagerTabLayout->addWidget(packagerTextBox, 0, 0);
    packageTabWidget->insertTab(packagerTab, trUtf8("Packager"));

    $layout14->addWidget(packageTabWidget, 1, 0);

    my $layout13 = Qt::HBoxLayout(undef, 11, 6, '$layout13');

    backButton = Qt::PushButton(centralWidget(), "backButton");
    backButton->setSizePolicy(Qt::SizePolicy(1, 1, 1, 0, backButton->sizePolicy()->hasHeightForWidth()));
    backButton->setText(trUtf8("&Back"));
    backButton->setIconSet(Qt::IconSet(uic_load_pixmap_Selector("backarrow.png")));
    Qt::ToolTip::add(backButton, trUtf8("Go to the previous step of the installer"));
    $layout13->addWidget(backButton);

    closeButton = Qt::PushButton(centralWidget(), "closeButton");
    closeButton->setSizePolicy(Qt::SizePolicy(1, 1, 2, 0, closeButton->sizePolicy()->hasHeightForWidth()));
    closeButton->setText(trUtf8("&Close"));
    closeButton->setIconSet(Qt::IconSet(uic_load_pixmap_Selector("close.png")));
    Qt::ToolTip::add(closeButton, trUtf8("Exit the OSCAR Package Selector"));
    $layout13->addWidget(closeButton);

    nextButton = Qt::PushButton(centralWidget(), "nextButton");
    nextButton->setSizePolicy(Qt::SizePolicy(1, 1, 1, 0, nextButton->sizePolicy()->hasHeightForWidth()));
    nextButton->setText(trUtf8("&Next"));
    nextButton->setIconSet(Qt::IconSet(uic_load_pixmap_Selector("nextarrow.png")));
    Qt::ToolTip::add(nextButton, trUtf8("Go to the next step of the installer"));
    $layout13->addWidget(nextButton);

    $layout14->addLayout($layout13, 2, 0);

    $SelectorLayout->addLayout($layout14, 0, 0);



    menubar= Qt::MenuBar( this, "menubar");



    Qt::Object::connect(closeButton, SIGNAL "clicked()", this, SLOT "closeButton_clicked()");
    Qt::Object::connect(backButton, SIGNAL "clicked()", this, SLOT "backButton_clicked()");
    Qt::Object::connect(nextButton, SIGNAL "clicked()", this, SLOT "nextButton_clicked()");

    setTabOrder(packageTabWidget, informationTextBox);
    setTabOrder(informationTextBox, providesTextBox);
    setTabOrder(providesTextBox, requiresTextBox);
    setTabOrder(requiresTextBox, backButton);
    setTabOrder(backButton, closeButton);
    setTabOrder(closeButton, nextButton);

    init();
}


sub init
{

#########################################################################
#  Subroutine: init                                                     #
#  Parameters: None                                                     #
#  Returns   : Nothing                                                  #
#  This code gets called after the widget is created but before it gets #
#  displayed.  This is so we can populate the packageTable, as well     #
#  as any other setup work.                                             #
#########################################################################

  # Update info boxes when row selection changes.
  Qt::Object::connect(packageTable, SIGNAL 'selectionChanged()',
                                    SLOT 'rowSelectionChanged()');

  # If there is a parent of this MainWindow, then we are probably running
  # it in the InstallerWorkspace.  Need to catch some signals.
  if (parent())
    {
      Qt::Object::connect(parent(),SIGNAL 'signalButtonShown(char*,char*,bool)',                                   SLOT   'setButtonShown(char*,char*,bool)');
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

  packageTable->populateTable();

}

sub closeButton_clicked
{

#########################################################################
#  Subroutine: exitButton_clicked                                       #
#  Parameters: None                                                     #
#  Returns   : Nothing                                                  #
#  When the exitButton is clicked, quit the application.                #
#########################################################################

  this->close(1);

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

sub updateTextBox
{

#########################################################################
#  Subroutine: updateTextBox                                            #
#  Parameters: (1) Which box to update (provides/requires/conflicts)    #
#              (2) Which package to provide info for                    #
#  Returns   : Nothing                                                  #
#  This subroutine is called by rowSelectedChanged to update the one    #
#  of the three informational boxes providesTextBox, requiresTextBox,   #
#  or conflictsTextBox.  Give it one of "provides", "requires", or      #
#  "conflicts", and the name of the package to provide info for.        #
#########################################################################

  my $box = shift;
  my $package = shift;

  my $output = "";

  foreach my $row ( @{ $SelectorUtils::allPackages->{$package}{$box} } )
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
#  We update the four text boxes at the bottom of the window:           #
#  information (description), provides, requires, and conflicts.        #
#########################################################################

  # Figure out which row of the table is now selected
  my $row = packageTable->selection(0)->anchorRow();

  return if ($row < 0);

  # Find the "short name" of the package in that row
  my $package = packageTable->text($row,0);

  # Update the four infomrational text boxes
  informationTextBox->setText(
    $SelectorUtils::allPackages->{$package}{description});
  updateTextBox("provides",$package);
  updateTextBox("requires",$package);
  updateTextBox("conflicts",$package);

  # Update the packager names / emails
  # We read in the names/emails as a single string, but there might have
  # been more than one packager.  If so , the delimiter is '","'.
  my @names = split /\",\"/, 
    $SelectorUtils::allPackages->{$package}{packager_name};
  my @emails = split /\",\"/, 
    $SelectorUtils::allPackages->{$package}{packager_email};
  my $packagerStr = "";
  for (my $arraypos = 0; $arraypos <= $#names; $arraypos++)
    {
      $packagerStr .= $names[$arraypos];
      $packagerStr .= " <" . $emails[$arraypos] . ">" if
        (length $emails[$arraypos] > 0);
      $packagerStr .= "\n";
    }
  packagerTextBox->setText($packagerStr);

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

1;


package main;

use Qt;
use Selector;

my $a = Qt::Application(\@ARGV);
my $w = Selector;
$a->setMainWidget($w);
$w->show;
exit $a->exec;
