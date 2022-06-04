import SwiftUI

public struct CompactArtistCell: View {
	public let model: CompactArtistViewModel
	
	private let titleFont: Font = .inter(ofSize: 12).bold()
	private let subtitleFont: Font = .inter(ofSize: 12)
	private let subtitleColor: Color = Color(.grey100)
	
	private let imageSize: CGFloat = 60
	
	public init(model: CompactArtistViewModel) {
		self.model = model
	}
	
	public var body: some View {
		HStack {
			image.fixedSize()
			VStack(alignment: .leading) {
				title
				songs
			}
		}
    }
	
	private var image: some View {
		AsyncImage(url: model.image) { phase in
			switch phase {
			case .success(let image):
				image.circleImage(size: imageSize)
			default:
				Image.placeholder?.circleImage(size: imageSize)
			}
		}
		.fixedSize()
	}
	
	private var title: some View {
		Text(model.name)
			.lineLimit(1)
			.font(titleFont)
	}
	
	private var songs: some View {
		Text(model.numberOfSongs)
			.font(subtitleFont)
			.foregroundColor(subtitleColor)
	}
}

struct CompactArtistCell_Previews: PreviewProvider {
    static var previews: some View {
		CompactArtistCell(model: MockData.compactArtistCells.first!)
			.preferredColorScheme(.dark)
    }
}