/**
 * Slide View
 *
 * This file is part of pdf-presenter-console.
 *
 * pdf-presenter-console is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3 of the License.
 *
 * pdf-presenter-console is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * pdf-presenter-console; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

using GLib;

namespace org.westhoffswelt.pdfpresenter.slide {
    /**
     * Base class for every slide view
     */
    public abstract class View: Gtk.DrawingArea {
        /**
         * Renderer to be used for rendering the slides
         */
        protected Renderer renderer;

        /**
         * Base constructor taking the renderer to use as an argument
         */
        protected View( Renderer renderer ) {
            this.renderer = renderer;
            this.set_size_request( 
                (int)renderer.get_width(),
                (int)renderer.get_height()
            );
        }
        
        /**
         * Return the used renderer object
         */
        public Renderer get_renderer() {
            return this.renderer;
        }

        /**
         * Goto the next slide
         *
         * If the end of slides is reached this method is expected to do
         * nothing.
         */
        public abstract void next();

        /**
         * Goto the previous slide
         *
         * If the beginning of slides is reached this method is expected to do
         * nothing.
         */
        public abstract void previous();

        /**
         * Goto a specific slide number
         *
         * If the slide number does not exist a RenderError.SLIDE_DOES_NOT_EXIST is thrown
         */
        public abstract void display( uint slide_number )
            throws RenderError;
    }
}
