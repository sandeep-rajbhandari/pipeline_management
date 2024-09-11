// Import and register all your controllers from the importmap via controllers/**/*_controller
import {application} from "./application"
import FormController from "./form_controller"

application.register("form", FormController)

import SortableController from "./sortable_controller"

application.register("sortable", SortableController)
