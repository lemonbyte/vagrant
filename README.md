vagrant
=======
<script language="JavaScript" type="application/javascript">
            //Jquery to define which nav item is active
            $( document ).ready(function() {
                $('#navContainer li').each(function (index, element) {
                    if(window.location.pathname == element.firstChild.getAttribute('href')) {
                        element.setAttribute('class', 'active');
                    }
                });
            });
        </script>
