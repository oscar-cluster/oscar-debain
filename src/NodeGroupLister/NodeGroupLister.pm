# Form implementation generated from reading ui file 'NodeGroupLister.ui'
#
# Created: Thu Dec 23 15:36:11 2004
#      by: The PerlQt User Interface Compiler (puic)
#
# WARNING! All changes made in this file will be lost!


use strict;
use utf8;


package NodeGroupLister;
use Qt;
use Qt::isa qw(Qt::Widget);
use Qt::slots
    init => [],
    closeButton_clicked => [],
    newButton_clicked => [],
    renameButton_clicked => [],
    deleteButton_clicked => [],
    modifyButton_clicked => [],
    nodeGroupListBox_highlighted => ['QListBoxItem*'],
    enableButtons => ['int'],
    reReadOda => ['char*'],
    closeEvent => ['QCloseEvent*'],
    showEvent => [],
    refreshNodeGroupListBox => [],
    nodeGroupIsSpecial => ['char*'],
    refreshMembershipListBoxes => [];
use Qt::signals
    taskToolClosing => ['char*'];
use Qt::attributes qw(
    textLabel1
    textLabel1_font
    nodeGroupListBox
    tabWidget
    tab
    groupListBox
    tab_2
    nodeListBox
    newButton
    renameButton
    deleteButton
    modifyButton
    closeButton
);

use lib '../Installer'; use InstallerUtils; use InstallerImages;;

sub uic_load_pixmap_NodeGroupLister
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

    if( name() eq "unnamed" )
    {
        setName("NodeGroupLister");
    }
    resize(544,368);
    setCaption(trUtf8("Node Group Lister"));

    my $NodeGroupListerLayout = Qt::GridLayout(this, 1, 1, 1, 6, '$NodeGroupListerLayout');

    my $layout25 = Qt::VBoxLayout(undef, 11, 6, '$layout25');

    textLabel1 = Qt::Label(this, "textLabel1");
    textLabel1->setSizePolicy(Qt::SizePolicy(1, 1, 0, 0, textLabel1->sizePolicy()->hasHeightForWidth()));
    textLabel1_font = Qt::Font(textLabel1->font);
    textLabel1_font->setPointSize(16);
    textLabel1->setFont(textLabel1_font);
    textLabel1->setText(trUtf8("Node Groups"));
    textLabel1->setAlignment(int(&Qt::Label::AlignVCenter));
    textLabel1->setIndent(int(10));
    $layout25->addWidget(textLabel1);

    my $layout24 = Qt::HBoxLayout(undef, 11, 6, '$layout24');

    my $layout14 = Qt::VBoxLayout(undef, 11, 6, '$layout14');

    nodeGroupListBox = Qt::ListBox(this, "nodeGroupListBox");
    nodeGroupListBox->insertItem(trUtf8("ALL"));
    nodeGroupListBox->insertItem(trUtf8("oscar_server"));
    nodeGroupListBox->insertItem(trUtf8("oscar_client"));
    nodeGroupListBox->insertItem(trUtf8("node1"));
    nodeGroupListBox->insertItem(trUtf8("node2"));
    nodeGroupListBox->setSizePolicy(Qt::SizePolicy(7, 7, 0, 1, nodeGroupListBox->sizePolicy()->hasHeightForWidth()));
    Qt::ToolTip::add(nodeGroupListBox, trUtf8("List of all current Node Groups"));
    $layout14->addWidget(nodeGroupListBox);

    tabWidget = Qt::TabWidget(this, "tabWidget");
    tabWidget->setSizePolicy(Qt::SizePolicy(7, 7, 0, 1, tabWidget->sizePolicy()->hasHeightForWidth()));

    tab = Qt::Widget(tabWidget, "tab");
    my $tabLayout = Qt::GridLayout(tab, 1, 1, 1, 6, '$tabLayout');

    groupListBox = Qt::ListBox(tab, "groupListBox");
    groupListBox->setSelectionMode(&Qt::ListBox::NoSelection);
    Qt::ToolTip::add(groupListBox, trUtf8("List of group members for the currently selected group"));

    $tabLayout->addWidget(groupListBox, 0, 0);
    tabWidget->insertTab(tab, trUtf8("Group Membership"));

    tab_2 = Qt::Widget(tabWidget, "tab_2");
    my $tabLayout_2 = Qt::GridLayout(tab_2, 1, 1, 1, 6, '$tabLayout_2');

    nodeListBox = Qt::ListBox(tab_2, "nodeListBox");
    nodeListBox->setSelectionMode(&Qt::ListBox::NoSelection);
    Qt::ToolTip::add(nodeListBox, trUtf8("List of nodes belonging to the currently selected group"));

    $tabLayout_2->addWidget(nodeListBox, 0, 0);
    tabWidget->insertTab(tab_2, trUtf8("Node Membership"));
    $layout14->addWidget(tabWidget);
    $layout24->addLayout($layout14);

    my $layout23 = Qt::VBoxLayout(undef, 11, 6, '$layout23');

    newButton = Qt::PushButton(this, "newButton");
    newButton->setSizePolicy(Qt::SizePolicy(1, 0, 0, 0, newButton->sizePolicy()->hasHeightForWidth()));
    newButton->setText(trUtf8("&New Group"));
    Qt::ToolTip::add(newButton, trUtf8("Create a new Node Group, optionally copying from a current group"));
    $layout23->addWidget(newButton);

    renameButton = Qt::PushButton(this, "renameButton");
    renameButton->setEnabled(0);
    renameButton->setSizePolicy(Qt::SizePolicy(1, 0, 0, 0, renameButton->sizePolicy()->hasHeightForWidth()));
    renameButton->setText(trUtf8("&Rename Group"));
    Qt::ToolTip::add(renameButton, trUtf8("Rename the currently selected Node Group"));
    $layout23->addWidget(renameButton);

    deleteButton = Qt::PushButton(this, "deleteButton");
    deleteButton->setEnabled(0);
    deleteButton->setSizePolicy(Qt::SizePolicy(1, 0, 0, 0, deleteButton->sizePolicy()->hasHeightForWidth()));
    deleteButton->setText(trUtf8("&Delete Group"));
    Qt::ToolTip::add(deleteButton, trUtf8("Delete the currently selected Node Group"));
    $layout23->addWidget(deleteButton);

    modifyButton = Qt::PushButton(this, "modifyButton");
    modifyButton->setEnabled(0);
    modifyButton->setSizePolicy(Qt::SizePolicy(1, 0, 0, 0, modifyButton->sizePolicy()->hasHeightForWidth()));
    modifyButton->setText(trUtf8("&Modify Membership"));
    Qt::ToolTip::add(modifyButton, trUtf8("Change the groups belonging to the currently selected Node Group"));
    $layout23->addWidget(modifyButton);
    my $spacer = Qt::SpacerItem(20, 56, &Qt::SizePolicy::Minimum, &Qt::SizePolicy::Expanding);
    $layout23->addItem($spacer);

    closeButton = Qt::PushButton(this, "closeButton");
    closeButton->setSizePolicy(Qt::SizePolicy(1, 0, 0, 0, closeButton->sizePolicy()->hasHeightForWidth()));
    closeButton->setText(trUtf8("&Close"));
    closeButton->setIconSet(Qt::IconSet(uic_load_pixmap_NodeGroupLister("close.png")));
    Qt::ToolTip::add(closeButton, trUtf8("Close this window"));
    $layout23->addWidget(closeButton);
    $layout24->addLayout($layout23);
    $layout25->addLayout($layout24);

    $NodeGroupListerLayout->addLayout($layout25, 0, 0);

    Qt::Object::connect(closeButton, SIGNAL "clicked()", this, SLOT "closeButton_clicked()");
    Qt::Object::connect(newButton, SIGNAL "clicked()", this, SLOT "newButton_clicked()");
    Qt::Object::connect(renameButton, SIGNAL "clicked()", this, SLOT "renameButton_clicked()");
    Qt::Object::connect(deleteButton, SIGNAL "clicked()", this, SLOT "deleteButton_clicked()");
    Qt::Object::connect(modifyButton, SIGNAL "clicked()", this, SLOT "modifyButton_clicked()");
    Qt::Object::connect(nodeGroupListBox, SIGNAL "highlighted(QListBoxItem*)", this, SLOT "nodeGroupListBox_highlighted(QListBoxItem*)");

    init();
}


sub init
{

  # If there is a parent of this MainWindow, then we are probably running
  # it in the InstallerWorkspace.  Need to connect some signals/slots.
  if (parent())
    {
      Qt::Object::connect(parent(),
                          SIGNAL 'odaWasUpdated(char*)',
                          SLOT   'reReadOda(char*)');
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

sub newButton_clicked
{
    print "NodeGroupLister->newButton_clicked(): Not implemented yet.\n";
}

sub renameButton_clicked
{

  # First, get the currently selected Node Group
  my $nodeGroup = nodeGroupListBox->currentText();
  print "Item selected is $nodeGroup\n";
  return if (length(InstallerUtils::compactSpaces($nodeGroup)) < 1);
  return;
  
  # Then, pop up an input dialog box for new group name
  my $ok;
  my $result = Qt::InputDialog::getText(
    "Rename Node Group",
    "Enter a new name for the Node Group\n<B>" .$nodeGroup. '<\B>:',
    Qt::LineEdit::Normal(),
    "",
    \$ok,
    this);
 
  $result = InstallerUtils::compactSpaces($result);
  $result =~ s/\s/\_/g;   # Change spaces to underscores
  if ($ok && (length($result) > 0))
    {
      print "Trying to rename Node Group '$nodeGroup' to '$result'...";
    }

}

sub deleteButton_clicked
{

  # First, get the currently selected Node Group
  my $nodeGroup = nodeGroupListBox->currentText();
  print "Item selected is $nodeGroup\n";
  return if (length(InstallerUtils::compactSpaces($nodeGroup)) < 1);
  return;
  
  # Then, pop up a confirmation message box
  my $result = Qt::MessageBox::warning(this,
    "Delete Node Group?",
    "Are you sure you want to delete the Node Group\n".
    '<B>' . $nodeGroup . '</B>?',
    Qt::MessageBox::Yes(),
    Qt::MessageBox::No());
 
  # Delete the node group if user clicked 'Yes'
  if ($result == Qt::MessageBox::Yes())
    {
      print "Trying to delete Node Group '$nodeGroup'...";
    }

}

sub modifyButton_clicked
{
    print "NodeGroupLister->modifyButton_clicked(): Not implemented yet.\n";
}

sub nodeGroupListBox_highlighted
{

  my $hilitedItem = shift;

  my $nodeGroupText = nodeGroupListBox->currentText();
  print "New item highlighted: '$nodeGroupText'\n";

  enableButtons(!(nodeGroupIsSpecial($nodeGroupText)));

  refreshTextBoxes();

}

sub enableButtons
{

  my $enable = shift;

  renameButton->setEnabled($enable);
  deleteButton->setEnabled($enable);
  modifyButton->setEnabled($enable);

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
  return if ($childname ne className());
                                                                            
  # Reread the oda database and update the GUI as necessary
  # ...

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

sub showEvent
{

  refreshNodeGroupListBox();

}

sub refreshNodeGroupListBox
{

  nodeGroupListBox->clear();
  my @nodeGroups = OSCAR::Database::database_return_list("node_groups");
  foreach my $group (sort @nodeGroups)
    {
      nodeGroupListBox->insertItem($group);
    }

}

sub nodeGroupIsSpecial
{

  my $nodeGroup = shift;
  my $retval = 0;

  # The node groups named 'all', 'oscar_clients', and 'oscar_server' are
  # always special and cannot be modified by the user.
  $retval = 1 if (($nodeGroup eq 'all') or
                  ($nodeGroup eq 'oscar_clients') or
                  ($nodeGroup eq 'oscar_server'));

  # Check to see if the nodeGroup is one of the special groups that contains
  # only the single node with the same name as the node group.
  $retval = (OSCAR::Database::database_return_list(
    "read_records node_groups name =$nodeGroup special"))[0] if
      (!$retval);

  return $retval;

}

sub refreshMembershipListBoxes
{
    print "NodeGroupLister->refreshMembershipListBoxes(): Not implemented yet.\n";
}

1;
