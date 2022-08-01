import Foundation
import Combine
import Login
import ModuleLinker
import Resolver

class MainViewModel: ObservableObject {
	private var cancellables = Set<AnyCancellable>()

	@Published var selectedTab: MainViewModelTab = .home
	@Published var shouldShowLogin: Bool = false

	@Injected private var loggedInUserUseCase: LoggedInUserUseCaseProtocol
	
	init() {
		loggedInUserUseCase.loggedInUser
			.print()
			.map { $0 == nil }
			.receive(on: DispatchQueue.main)
			.assign(to: \.shouldShowLogin, on: self)
			.store(in: &cancellables)
	}
}
