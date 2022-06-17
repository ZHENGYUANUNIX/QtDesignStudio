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

#pragma once

#include "modelnode.h"
#include <abstractview.h>

namespace ExamplePlugin {

class ExamplePluginViewWidget;

class ExamplePluginView : public QmlDesigner::AbstractView
{
    Q_OBJECT

public:
    ExamplePluginView();
    ~ExamplePluginView();

    void modelAttached(QmlDesigner::Model *model) override;
    void nodeAboutToBeRemoved(const QmlDesigner::ModelNode &removedNode) override;
    void nodeRemoved(const QmlDesigner::ModelNode &removedNode,
                     const QmlDesigner::NodeAbstractProperty &parentProperty,
                     PropertyChangeFlags propertyChange) override;
    void nodeReparented(const QmlDesigner::ModelNode &node,
                        const QmlDesigner::NodeAbstractProperty &newPropertyParent,
                        const QmlDesigner::NodeAbstractProperty &oldPropertyParent,
                        AbstractView::PropertyChangeFlags propertyChange) override;
    void propertiesAboutToBeRemoved(
        const QList<QmlDesigner::AbstractProperty> &propertyList) override;
    void propertiesRemoved(const QList<QmlDesigner::AbstractProperty> &propertyList) override;
    void bindingPropertiesAboutToBeChanged(
        const QList<QmlDesigner::BindingProperty> &propertyList) override;
    void bindingPropertiesChanged(const QList<QmlDesigner::BindingProperty> &propertyList,
                                  PropertyChangeFlags propertyChange) override;
    void auxiliaryDataChanged(const QmlDesigner::ModelNode &node,
                              const QmlDesigner::PropertyName &name,
                              const QVariant &data) override;

    void selectedNodesChanged(const QList<QmlDesigner::ModelNode> &selectedNodeList,
                                      const QList<QmlDesigner::ModelNode> &lastSelectedNodeList) override;

    QmlDesigner::WidgetInfo widgetInfo() override;
    bool hasWidget() const override;

private:
    void initWidget();

    ExamplePluginViewWidget *m_widget = nullptr;

private:
};

} // namespace ExamplePlugin
