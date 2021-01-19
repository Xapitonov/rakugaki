/*
* Copyright (c) 2019 Lains
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
*/
namespace Rakugaki {
    public class Application : Gtk.Application {
        public MainWindow window;
        public static GLib.Settings gsettings;
        public static Granite.Settings grsettings;

        public Application () {
            Object (flags: ApplicationFlags.FLAGS_NONE,
            application_id: "com.github.lainsce.rakugaki");
        }

        static construct {
            gsettings = new GLib.Settings ("com.github.lainsce.rakugaki");
        }

        construct {
            grsettings = Granite.Settings.get_default ();
        }

        protected override void activate () {
            if (window != null) {
                window.present ();
                return;
            }
            window = new MainWindow (this);
        }

        public static int main (string[] args) {
            Intl.setlocale (LocaleCategory.ALL, "");
            Intl.textdomain ("com.github.lainsce.rakugaki");

            var app = new Rakugaki.Application ();
            return app.run (args);
        }
    }
}
