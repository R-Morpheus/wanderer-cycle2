import { classNames } from '@/shared/lib/classNames/classNames';
import { AppLink, AppLinkTheme } from '@/shared/ui/AppLink/AppLink';
import { RoutePath } from '@/shared/config/routeConfig';
import cls from './Navbar.module.scss';

interface NavbarProps {
  className?: string;
}

export const Navbar = ({ className }: NavbarProps) => {
  return (
    <div
      data-testid="sidebar"
      className={classNames(cls.Sidebar, { [cls.collapsed]: collapsed }, [className])}
    >
      <div className={cls.items}>
        <AppLink
          theme={AppLinkTheme.SECONDARY}
          to={RoutePath.main}
          className={cls.item}
        >
          <span className={cls.link}>
          </span>
        </AppLink>
        <AppLink
          theme={AppLinkTheme.SECONDARY}
          to={RoutePath.about}
          className={cls.item}
        >
          <span className={cls.link}>
          </span>
        </AppLink>
      </div>
    </div>
  );
};


const gameRoutes = [
  // show maps by default
  {
    title: "Maps",
    path: "",
    element: <GlobalMaps />,
  },
  // other game pages
  {
    title: "Inventory",
    path: "inventory",
    element: <InventoryPage />,
  },
  {
    title: "Skills",
    path: "skills",
    element: <SkillsPage />,
  },
  {
    title: "Cycle",
    path: "cycle",
    element: <CyclePage />,
  },
];

const otherRoutes = [
  {
    title: "Wanderer Select",
    path: "wanderer-select",
    element: <WandererSelect />,
  },
];

const router = createBrowserRouter([
  {
    path: "/",
    element: <Layout />,
    errorElement: <RootBoundary />,
    children: [
      {
        element: <GameRoot />,
        children: gameRoutes,
      },

      ...otherRoutes,
    ],
  },
]);

export function AppRouter() {
  return (
    <div>
      <RouterProvider router={router} />
    </div>
  );
}

function Layout() {
  const { wandererMode, toggleWandererMode } = useWandererContext();
  const bg = useMemo(() => (wandererMode ? "bg-dark-600" : "bg-dark-500"), [wandererMode]);

  return (
    <div>
      <div className={`flex flex-row flex-wrap items-center justify-around h-16 ${bg} border border-dark-400`}>
        <div>
          <CustomButton className="w-20" onClick={toggleWandererMode}>
            {wandererMode ? "return" : "void"}
          </CustomButton>
        </div>
        <nav className="flex flex-wrap items-center justify-around w-2/3">
          {[...gameRoutes, ...otherRoutes].map(({ title, path }) => (
            <NavLink
              key={path}
              className={({ isActive }) => `transition duration-700 text-lg ${isActive ? "" : "text-dark-300"}`}
              to={path}
            >
              {title}
            </NavLink>
          ))}
          <div className="flex gap-x-8 text-dark-300">
            <NavLink to={"https://github.com/dk1a/wanderer-cycle"} target={"_blank"}>
              github
            </NavLink>
            <NavLink to={"https://discord.gg/9pX3h53VnX"} target={"_blank"}>
              discord
            </NavLink>
          </div>
        </nav>
      </div>
      <Outlet />
    </div>
  );
}