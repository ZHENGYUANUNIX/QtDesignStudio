/****************************************************************************
**
** Copyright (C) 2020 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Creator.
**
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 as published by the Free Software
** Foundation with exceptions as appearing in the file LICENSE.GPL3-EXCEPT
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
****************************************************************************/

#include "examplepluginview.h"
#include "examplepluginviewwidget.h"

#include <bindingproperty.h>

using namespace QmlDesigner;

namespace ExamplePlugin {

ExamplePluginView::ExamplePluginView() {}

ExamplePluginView::~ExamplePluginView() = default;

void ExamplePluginView::modelAttached(Model *model)
{
    AbstractView::modelAttached(model);
    m_widget->appendText("Model Attached");
}

void ExamplePluginView::nodeAboutToBeRemoved(const ModelNode &removedNode)
{
    m_widget->appendText("Node about to be removed " + removedNode.id());
}

void ExamplePluginView::nodeRemoved(const ModelNode &removedNode,
                                    const NodeAbstractProperty &,
                                    PropertyChangeFlags)
{
    m_widget->appendText("Node removed " + removedNode.id());
}

void ExamplePluginView::nodeReparented(const ModelNode &modelNode,
                                       const NodeAbstractProperty &,
                                       const NodeAbstractProperty &,
                                       PropertyChangeFlags)
{
    m_widget->appendText("Node repatrented " + modelNode.id());
}

void ExamplePluginView::propertiesAboutToBeRemoved(const QList<AbstractProperty> &properties)
{
    m_widget->appendText("Property about to be removed");

    for (const AbstractProperty &property : properties)
        m_widget->appendText(QString::fromLatin1(property.name()));
}

void ExamplePluginView::propertiesRemoved(const QList<AbstractProperty> &properties)
{
    m_widget->appendText("Property removed");

    for (const AbstractProperty &property : properties)
        m_widget->appendText(QString::fromLatin1(property.name()));
}

void ExamplePluginView::bindingPropertiesAboutToBeChanged(const QList<BindingProperty> &properties)
{
    m_widget->appendText("Binding about to change change");

    for (const BindingProperty &property : properties)
        m_widget->appendText(QString::fromLatin1(property.name()));
}

void ExamplePluginView::bindingPropertiesChanged(const QList<BindingProperty> &properties,
                                                 PropertyChangeFlags)
{
    m_widget->appendText("Binding changed");

    for (const BindingProperty &property : properties)
        m_widget->appendText(QString::fromLatin1(property.name()));
}

void ExamplePluginView::auxiliaryDataChanged(const ModelNode &modelNode,
                                             const PropertyName &name,
                                             const QVariant &value)
{
    m_widget->appendText("Node auxiliary data changed " + modelNode.id() + " " + name + " " + value.toString());
}

void ExamplePluginView::selectedNodesChanged(const QList<ModelNode> &selectedNodeList, const QList<ModelNode> &)
{
    m_widget->appendText("Node selected");

    for (const ModelNode &node : selectedNodeList)
        m_widget->appendText(node.id());
}

WidgetInfo ExamplePluginView::widgetInfo()
{
    initWidget();

    return createWidgetInfo(m_widget,
                            new WidgetInfo::ToolBarWidgetDefaultFactory<ExamplePluginViewWidget>(
                                m_widget),
                            QLatin1String("ExamplePluginView"),
                            WidgetInfo::LeftPane,
                            0,
                            tr("ExamplePlugin"));
}

bool ExamplePluginView::hasWidget() const
{
    return true;
}

void ExamplePluginView::initWidget()
{
    if (m_widget)
        return;

    m_widget = new ExamplePluginViewWidget();
}

} // namespace ExamplePlugin
