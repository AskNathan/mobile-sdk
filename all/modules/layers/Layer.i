#ifndef _LAYER_I
#define _LAYER_I

#pragma SWIG nowarn=401

%module Layer

!proxy_imports(carto::Layer, core.MapRange, core.ScreenPos, graphics.ViewState, renderers.components.CullState, ui.ClickType)

%{
#include "layers/Layer.h"
#include <memory>
%}

%include <std_shared_ptr.i>
%include <cartoswig.i>

%import "core/MapRange.i"
%import "core/ScreenPos.i"
%import "graphics/ViewState.i"
%import "renderers/components/CullState.i"
%import "ui/ClickType.i"

!polymorphic_shared_ptr(carto::Layer, layers.Layer)
!value_type(std::vector<std::shared_ptr<carto::Layer> >, layers.LayerVector)

%attribute(carto::Layer, int, UpdatePriority, getUpdatePriority, setUpdatePriority)
%attribute(carto::Layer, int, CullDelay, getCullDelay, setCullDelay)
%attribute(carto::Layer, bool, Visible, isVisible, setVisible)
%attributeval(carto::Layer, carto::MapRange, VisibleZoomRange, getVisibleZoomRange, setVisibleZoomRange)
%attribute(carto::Layer, float, Opacity, getOpacity, setOpacity)
%ignore carto::Layer::isSurfaceCreated;
%ignore carto::Layer::onSurfaceCreated;
%ignore carto::Layer::onDrawFrame;
%ignore carto::Layer::onSurfaceDestroyed;
%ignore carto::Layer::calculateRayIntersectedElements;
%ignore carto::Layer::registerDataSourceListener;
%ignore carto::Layer::unregisterDataSourceListener;
%ignore carto::Layer::getCullDelay;
%ignore carto::Layer::getLastCullState;
!standard_equals(carto::Layer);

%include "layers/Layer.h"

!value_template(std::vector<std::shared_ptr<carto::Layer> >, layers.LayerVector)

#endif
