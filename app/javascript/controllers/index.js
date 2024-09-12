// Import and register all your controllers from the importmap via controllers/**/*_controller
import {application} from "./application"
import FormController from "./form_controller"

application.register("form", FormController)

import SortableController from "./sortable_controller"

application.register("sortable", SortableController)

import MultipleCheckSelectController from "./multiple_check_select_controller"

application.register("multiple-check-select", MultipleCheckSelectController)

import ModalController from "./modal_controller"

application.register("modal", ModalController)
